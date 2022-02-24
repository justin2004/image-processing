(in-package :im)



(setf *look-at-image* #'identity)
; (setf *look-at-image* #'jupyter:file)

(defun read-png (path)
  "converts to greyscale and sets img in april"
  (progn
    (april (with (:store-fun 
                   (forcesmall (function force-small))) 
                 (:state 
                   :in 
                   ((img_in (opticl:read-png-file path)))))
           "img←forcesmall⌊(+/img_in)÷¯1↑⍴img_in")
    (write-array (april "img") )))

(defun force-small (a)
  "forces a resize to width 300"
  (let* ((dims (april-c "{⌊(⍴⍵)×300.0÷1↑⍴⍵}" a))
         (rows (svref dims 0))
         (cols (svref dims 1)))
    (opticl:resize-image
      a
      rows
      cols)))


(defun write-array (a)
  "write the array as a png"
  (write-array-as-png (force-small a)))



(defun look (path)
  (funcall *look-at-image*
           path))

(defun write-array-as-png (a &optional (out-path "temp0.png"))
  "a: the array"
  (progn
    (opticl:write-png-file out-path
                         (make-array (array-dimensions a) 
                                     :element-type '(unsigned-byte 8) 
                                     :initial-contents (april::array-to-list a)))
    (funcall *look-at-image* 
             out-path)))



(defun download-jpg (url filename)
  (let* ((somejpg (multiple-value-bind (a &rest b)  
                    (drakma:http-request url)        
                    a)))
    (alexandria:write-byte-vector-into-file somejpg 
                                            filename
                                            :if-does-not-exist :create
                                            :if-exists :overwrite)
    filename))


; (defun run (apl-string)
;   (jupyter:file (namestring 
;                   (write-array-as-png 
;                     (april:april apl-string)))))



(defun write-animated-gif (vec)
  "vec: a vector of mats"
  (let* ((delay 100)
         (first-mat-dims (array-dimensions (elt vec 0))) ; assumes all mats have the same dims as the first
         (height (first first-mat-dims))
         (width (second first-mat-dims))
         (color-table (skippy:make-color-table))
         (data-stream (skippy:make-data-stream :height height
                                               :width width
                                               :color-table color-table))
         ; (image (make-image :delay-time 100 :height height :width width))
         (images (mapcar #'(lambda (mat)
                             (let* ((im (skippy:make-image :delay-time delay
                                                           :height height
                                                           :width width)))
                               (setf (skippy:image-data im) (make-array (* height width) 
                                                                        :element-type '(unsigned-byte 8)
                                                                        :initial-contents 
                                                                        (april::array-to-list (april:april-c "{,⍵}" mat))))
                               (skippy:add-image im data-stream)))
                         (april::array-to-list vec))))
    (dotimes (i 256) 
      (skippy:add-color (skippy:rgb-color i i i)
                        color-table))
    (setf (skippy:loopingp data-stream) t)
    (skippy:output-data-stream data-stream #p"example3.gif")))
