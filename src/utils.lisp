(in-package :im)


; TODO write a resize image function to make filters fast



; (setf *look-at-image* #'identity)
(setf *look-at-image* #'jupyter:file)




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
