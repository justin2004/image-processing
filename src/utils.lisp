(in-package :im)


; TODO write a resize image function to make filters fast

(defun write-array-as-png (a &optional (out-path "/tmp/temp0.png"))
  "a: the array"
  (progn
    (opticl:write-png-file out-path
                         (make-array (array-dimensions a) 
                                     :element-type '(unsigned-byte 8) 
                                     :initial-contents (april::array-to-list a)))
    out-path))



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
