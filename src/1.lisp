(ql:quickload "april") 
(ql:quickload "opticl")
(ql:quickload "drakma")
(ql:quickload "alexandria")

(defpackage :image-filtering 
  (:nicknames :im)
  (:use :common-lisp :april :opticl :drakma :alexandria))
(in-package :im)
(load "src/utils.lisp")

; what is APL
;
; APL
; is rules and meaning
;    (syntax and semantics)
;
; some APLs include:
;   Dyalog, GNU APL, April


; Image Representation
(write-array-as-png (april-f "200 × 5 6 ⍴ 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0"))


; most math symbols do what you would expect them to do
; = + - ÷ × etc.

; APL is nemonic


; Terms:

; Scalar - first define outside of APL
(april "1")


; Vector
(april "2 4 6 8")

; Dimensions, Rank, Shape
(april "⍴1")
(april "⍴2 4 6 8")
(april "⍴⍴ 2 4 6 8")


; Matrix a.k.a "Array" 
(april-f "4 4 ⍴ 1 2 3" )
(april  "⍴4 4 ⍴ 1 2 3" )
(april "⍴⍴4 4 ⍴ 1 2 3" )

; Function
; Operand

; Monadic
(april "÷ 9")

; Dyadic
(april "4 + 6")

; Nested

; Item

; Pixel

; Axis



; Functions and Operators

; ←
; assignment
(april "sam←3 4 5")
(april "sam + 2")

; ⍳
(april "⍳9")

; ⍴
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


; ⍉
; Transpose
(april "⎕←twenty_five_square←5 5 ⍴ ⍳25")
(april-f "twenty_five_square")
(april-f "⍉twenty_five_square")

(write-array-as-png (april "⍉m"))
(write-array-as-png (april "⍉⍉m"))

; ,
(april "20 30 40,sam")


; ⎕
; look
(april "⎕← 8 7 6" )

; ⋄
(april "1 ⋄ 2" )
(april "⎕←1 ⋄ 2" )
(april "⎕←1 ⋄ 2 ⋄ 99" )

; [ ]
(april "sam[1]")
(april "⎕←m ⋄ 0")
(april "m[1;]")


; +/
(april "+/1 3 5 7")
(april "+/sam")

; ⌈
(april "⌈4.2")

; ⌊
(april "⌊4.2")

; |
; remainder
(april "5|10")
; 10 divided by 5 is 2 and the remainder is 0

(april "5|9")
; 9 divided by 5 is 1 and the remainder is 4

; ¨
(april "÷5")


; {}

; ⊂

; ⊃

; ∘.

; *


;;;;;;;;;;;;;;;


(jupyter:file "/tmp/la0.png")



(download-jpg  "https://static.wikia.nocookie.net/homealone/images/4/47/Download-0.jpg/revision/latest/scale-to-width-down/259?cb=20170724041438" "some.jpg")
(setf *wet-bandits* (opticl:read-jpeg-file "some.jpg"))

(jupyter:file "/tmp/la0.jpg")

(uiop:run-program "identify /tmp/la0.jpg" :output t)
(uiop:run-program "file /tmp/la0.jpg" :output t)

; get the image into april
(april (with (:state :in ((a *wet-bandits*)))) "img←a")

(list-all-packages)

(april "⍴img")

; to grayscale
(april "m←⌊(+/img)÷¯1↑⍴img")

(april "⍴m")
; notice we've lost a dimension (axis?)

(april "m")

(jupyter:file (namestring (write-array-as-png (april:april "⎕←m"))))


(write-array-as-png (april "⎕←100 100 ⍴ 100?200"))

(run "⎕←100 100 ⍴ 100?200")
; https://www.keyence.com/ss/products/auto_id/barcode_lecture/basic/mechanism/
; homework, make a barcode?


;;;;;;;;;;;


(april "img")
(april "m←⌊(+/img)÷¯1↑⍴img")
(april "res←{⍺,≢⍵} ⌸ ,m")
(april-f "sorted←res[⍋⌽res;]")
(april-f "sorted←res[⍒res;]")
(april "values←sorted[⍳1⊃⍴sorted;1]") ; values
(april "counts←sorted[⍳1⊃⍴sorted;2]") ; counts
(write-array-as-png (april "(⍴m) ⍴ counts/values"))




; TODO note that the wet bandits, after sobel, seem to have 
; extra information. jpeg artifacts?

; one shot
(progn
  (april "one← ¯1  0  1")
  (april "two← ¯2  0  2")
  (april "thr← ¯1  0  1")
  (april "kernel←3 3 ⍴ one,two,thr")
  (april-f "kernelsum←1⌈|⌊+/+/kernel") ; the sum's absolute value
  (april "g←⍉kernel")
  (april-f "pairs←,(¯1+⍳(¯2+(⍴m)[1]))∘.,¯1+⍳(¯2+(⍴m)[2])")
  (april "get_submats←{row←⍵[1]⋄col←⍵[2]⋄m[row+⍳3;col+⍳3]}")
  (april "sub_mats←get_submats¨pairs")
  (april-f "Gx←(⊂kernel)×sub_mats") ; gradient in x
  (april-f "Gy←(⊂g)×sub_mats")      ; gradient in y
  (april-f "filteredx ←(¯2+(⍴m)[1]) (¯2+(⍴m)[2]) ⍴ +/¨+/¨Gx")
  (april-f "filteredy ←(¯2+(⍴m)[1]) (¯2+(⍴m)[2]) ⍴ +/¨+/¨Gy")
  ; now only keep if above a threshhold
  ; (april "filtered←filtered×filtered<150")

  ; sobel
  (april-f "final←((filteredx*2)+filteredy*2)*0.5")
  (write-array-as-png
    (april "255⌊0⌈⌈final÷kernelsum")))
