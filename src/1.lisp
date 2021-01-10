(ql:quickload "april") 
(ql:quickload "opticl")
(ql:quickload "drakma")
(ql:quickload "alexandria")

(defpackage :image-filtering 
  (:nicknames :im)
  (:use :common-lisp :april :opticl :drakma :alexandria))

(in-package :im)

; what is APL

; APL
; rules and meaning
; syntax and semantics
; Dyalog, GNU APL, April


; Image Representation
(write-array-as-png (april-f "200 × 5 6 ⍴ 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0"))


; most math symbols do what you would expect them to do
; = + - ÷ × etc.

; Nemonic


Terms:

Scalar - first define outside of APL
(april "1")

Dimensions, Rank, Shape
(april "⍴1")

Vector
(april "2 4 6 8")

(april "⍴2 4 6 8")
(april "⍴⍴ 2 4 6 8")


Matrix a.k.a "array" 
(april-f "4 4 ⍴ 1 2 3" )
(april  "⍴4 4 ⍴ 1 2 3" )
(april "⍴⍴4 4 ⍴ 1 2 3" )

Function
Operand

Monadic
(april "- 9")

Dyadic
(april "4 + 6")

Nested
Item
Pixel
Axis



Functions and Operators
←
; assignment
(april "sam←3 4 5")
(april "sam + 2")

⍳
(april "⍳9")

⍴
; monadic ⍴ tells you the shape
(april "⍴ 2 4 6 8 10")
(april "⍴ sam")

; dyadic ⍴ reshapes
(april "15 ⍴ sam")
; Read as: "15 reshape sam" makes a vector 15 items long using sam



(april "v←0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 168 168 168 168 168 168 168 0 0 0 0 0 0 0 0 0 0 0 168 168 168 168 168 168 168 168 168 168 168 0 0 0 0 0 0 0 0 168 168 168 168 168 168 168 168 168 168 168 168 168 0 0 0 0 0 0 168 168 168 168 0 0 168 168 168 82 0 168 168 168 168 0 0 0 0 168 168 168 168 168 0 0 168 168 168 0 0 168 168 168 168 168 0 0 2 168 168 168 168 168 0 0 168 168 168 0 0 168 168 168 168 168 0 0 168 168 168 168 168 168 0 0 168 168 168 0 0 168 168 168 168 168 168 0 168 168 168 168 168 168 0 0 168 168 168 0 0 168 168 168 168 168 168 0 168 168 168 168 168 168 168 168 168 168 168 168 86 168 168 168 168 168 168 0 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 152 168 168 0 168 168 0 168 168 168 168 168 168 168 168 168 168 168 168 168 0 168 168 0 168 168 153 168 168 168 168 168 168 168 168 168 168 168 168 168 152 168 168 0 168 168 168 151 168 168 168 168 168 168 168 168 168 168 168 0 168 168 168 0 0 168 168 0 168 168 168 168 168 168 168 168 168 168 168 144 168 168 0 0 93 168 168 168 0 168 168 168 168 168 168 168 168 168 0 168 168 168 88 0 145 0 168 168 168 142 0 168 168 168 168 168 0 168 168 168 168 168 142 0 168 0 0 168 168 168 168 168 4 0 9 168 168 168 168 168 0 34 168 0 150 121 40 0 168 168 168 168 168 168 168 168 168 168 168 168 37 0 150 0 0 168 168 53 168 0 168 168 168 168 168 168 168 0 168 0 168 157 0")

(april "m←20 20 ⍴ v")
; notice the -f
(april-f "m")
(write-array-as-png (april "m"))


⍉
; Transpose
(april "⎕←twenty_five_square←5 5 ⍴ ⍳25")
(april-f "twenty_five_square")
(april-f "⍉twenty_five_square")

(write-array-as-png (april "⍉m"))
(write-array-as-png (april "⍉⍉m"))

,
(april "20 30 40,sam")

[ ]
(april "sam[1]")

+/
(april "+/1 3 5 7")
(april "+/sam")

⌈
(april "⌈4.2")

⌊
(april "⌊4.2")

|
; remainder
(april "5|10")
; 10 divided by 5 is 2 and the remainder is 0
(april "5|9")
; 9 divided by 5 is 1 and the remainder is 4

¨
(april "÷5")


{}

⊂

⊃

∘.

*


;;;;;;;;;;;;;;;


(april "⍴ 5 6 7")


(let* ((ar (april "300 300 ⍴ (300×300)?255")))
  (with-open-file (s "/tmp/la.png" :direction :output :if-does-not-exist :create :if-exists :overwrite )
    (opticl:write-png-file "/tmp/la0.png"
                             (make-array (array-dimensions ar)
                                         :element-type '(unsigned-byte 8)
                                         :initial-contents (april::array-to-list ar)))))
(jupyter:file "/tmp/la0.png")

(defun write-array-as-png (a &optional (out-path "/tmp/temp0.png"))
  "a: the array"
  (opticl:write-png-file out-path
                         (make-array (array-dimensions a) 
                                     :element-type '(unsigned-byte 8) 
                                     :initial-contents (april::array-to-list a))))

(let* ((somejpg (multiple-value-bind (a &rest b)  
                   (drakma:http-request "https://static.wikia.nocookie.net/homealone/images/4/47/Download-0.jpg/revision/latest/scale-to-width-down/259?cb=20170724041438")        
                   a)))
  (alexandria:write-byte-vector-into-file somejpg 
                               "/tmp/la0.jpg"
                                          :if-does-not-exist :create
                               :if-exists :overwrite))

(jupyter:file "/tmp/la0.jpg")

(setf *wet-bandits* (opticl:read-jpeg-file "/tmp/la0.jpg"))

; get the image into april
(april (with (:state :in ((a *wet-bandits*)))) "img←a")

(list-all-packages)

(april "⍴img")

; to grayscale
(april "m←⌊(+/img)÷¯1↑⍴img")

(april "⍴m")
; notice we've lost a dimension

(april "m")

(jupyter:file (namestring (write-array-as-png (april:april "⎕←m"))))

(defun run (str)
  (jupyter:file (namestring 
                  (write-array-as-png 
                    (april:april str)))))

(run "⎕←m")

(write-array-as-png (april "⎕←100 100 ⍴ 100?200"))

(run "⎕←100 100 ⍴ 100?200")
; https://www.keyence.com/ss/products/auto_id/barcode_lecture/basic/mechanism/
; homework, make a barcode?


;;;;;;;;;;;


(april "img")
(april "m←⌊(+/img)÷¯1↑⍴img")
(april "res←{⍺,≢⍵} ⌸ ,m")
(april-f "sorted←res[⍋⌽res;]")
(april "values←sorted[⍳1⊃⍴sorted;1]") ; values
(april "counts←sorted[⍳1⊃⍴sorted;2]") ; counts
(write-array-as-png (april "(⍴m) ⍴ counts/values"))
