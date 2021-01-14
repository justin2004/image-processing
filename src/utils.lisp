(in-package :im)



; (setf *look-at-image* #'identity)
(setf *look-at-image* #'jupyter:file)

(defun read-png (path)
  "converts to greyscale and sets img in april"
  (progn
    (april (with (:state 
                   :in 
                   ((img_in (opticl:read-png-file path)))))
           "img←⌊(+/img_in)÷¯1↑⍴img_in")
    (write-array (april "img") )))

(defun write-array (a)
  "right now it forces a resize to width 300 "
  (let* ((dims (april-c "{⌊(⍴⍵)×300.0÷1↑⍴⍵}" a))
       (rows (svref dims 0))
       (cols (svref dims 1)))
  (write-array-as-png (opticl:resize-image
                        a
                        rows
                        cols))))



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
