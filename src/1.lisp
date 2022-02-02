; Welcome to a Jupyter notebook!

; Why are we in a Jupyter notebook?
; 
; We will be learning, editing, and running code in this notebook.


; What is Jupyter?
;
; Computational Notebook (notebooks for code)

; What can you do in a Jupyter notebook?
; 
; - look at code and the results of running the code
; - edit the code
; - run the code

; Because it is a computational notebook things are not hidden from you
;
; So in addition to reading notes and code you sometimes have to run cells
;
; You run cells by pressing ctrl-enter or (on a Mac) cmd-enter 

; put your cursor in this cell and run it by pressing ctrl-enter
(ql:quickload "april") 
(ql:quickload "opticl")
(ql:quickload "drakma")
(ql:quickload "alexandria")
(ql:quickload "skippy")
(defpackage :image-filtering 
  (:nicknames :im)
  (:use :common-lisp :april :opticl :drakma :alexandria))
(in-package :im)
(load "utils.lisp")

; What is APL?
;
;   "A Programming Language"

; APL (the langauge)
;
;    rules   (syntax)
;    and
;    meaning (semantics)
;

; APLs (the versions)
; 
; Some APLs include:
;   Dyalog, GNU APL, and April

; We are using April!

; You can try Dyalog here: 
; https://tryapl.org/

; You can edit images with APL among many other things

; What are images?
 
; Is this an image?
(april-f "0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0")

; ...about April
; notice the -f
;
; I think about the -f as meaning "friendly"

; Image Representation
(write-array (april-f "200 × 5 6 ⍴ 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0"))

; Because images are represented as numbers we need some math to work with them


; In APL, most math symbols do what you would expect them to do
;
; = + - ÷ × etc.

; APL is a small language

; How small?

; In order to see the APL symbols we need to load some javascript in your browser
; 
; This is usually done in the "Console" often found in "Developer Tools"

var script = document.createElement ("script");
script.src = "https://abrudz.github.io/lb/lb.js";
document.body.appendChild (script);


; APL is designed to be mnemonic
; 
; : assisting or intended to assist memory 



; Behind every image on a computer there are just numbers
;
; For this class those numbers are: 0 through 255
; 
; 0   is black
; 255 is white
; 
; What number represents gray?


; What is a pixel?
;  : PIcture ELement

; let's look at some pixels
;
; first we need an image
(read-png "images/sia.png")

; after you execute (read-png) a greyscale copy of your image
; is in April as "img"

; let's look at the size of it now using ⍴
(april "⍴ img")


; let's look at a single pixel
(april "img[200;200]")
; the 200th row
; the 200th column

; let's look at one row of pixels
(april "img[1;]")


; let's modify it
(write-array (april "img × img>150"))



; Terms
;
; We need to learn some words used in APL

; Scalar
(april "1")


; Vector
(april "2 4 6 8")


; Please Excuse My Dear Aunt Sally?

; Order of Operations in APL:
; 
; right to left
; and
; the space between vectors are strong!

; Dimensions, Rank, Shape

(april "⍴1")

(april "⍴2 4 6 8")

(april "⍴⍴ 2 4 6 8")


; Matrix a.k.a "array"  a.k.a "grid"

(april-f "4 4 ⍴ 1 2 3" )

(april  "⍴4 4 ⍴ 1 2 3" )

(april "⍴⍴4 4 ⍴ 1 2 3" )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Let's generate some random images

; first an image with all black pixels
(write-array (april "10 10 ⍴ 0"))

; an image with all white pixels
(write-array (april "10 10 ⍴ 255"))

; an image with all grey pixels
(write-array (april "10 10 ⍴ 100"))

; ?
; roll

(april "?255")

; a 10 by 10 pixel image with random pixel values
(write-array (april "?10 10 ⍴ 255"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Function and Operands:
(april "8 - 3")
; - is the function
; 8 is the function's left operand
; 3 is the function's right operand

; Monadic Function

(april "÷ 9")
; mon-  mono-
; : one : single : alone 

; Dyadic Function

(april "4 + 6")
; dyad
; : pair

; Nested

; Item

; Axis



; Functions and Operators

; ←
; assignment

(april "sam←50 100 200")

(april "sam")

(april "sam ÷ 2")

; ⍳  iota

(april "⍳9")

; ⍴  rho
; monadic ⍴ tells you the shape of something

(april "⍴ 2 4 6 8 10")

(april "⍴ sam")

; dyadic ⍴ reshapes
(april "15 ⍴ sam")
; Read as: "15 reshape sam" makes a vector 15 items long using sam



; assign to v this vector
(april "v←0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 168 168 168 168 168 168 168 0 0 0 0 0 0 0 0 0 0 0 168 168 168 168 168 168 168 168 168 168 168 0 0 0 0 0 0 0 0 168 168 168 168 168 168 168 168 168 168 168 168 168 0 0 0 0 0 0 168 168 168 168 0 0 168 168 168 82 0 168 168 168 168 0 0 0 0 168 168 168 168 168 0 0 168 168 168 0 0 168 168 168 168 168 0 0 2 168 168 168 168 168 0 0 168 168 168 0 0 168 168 168 168 168 0 0 168 168 168 168 168 168 0 0 168 168 168 0 0 168 168 168 168 168 168 0 168 168 168 168 168 168 0 0 168 168 168 0 0 168 168 168 168 168 168 0 168 168 168 168 168 168 168 168 168 168 168 168 86 168 168 168 168 168 168 0 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 152 168 168 0 168 168 0 168 168 168 168 168 168 168 168 168 168 168 168 168 0 168 168 0 168 168 153 168 168 168 168 168 168 168 168 168 168 168 168 168 152 168 168 0 168 168 168 151 168 168 168 168 168 168 168 168 168 168 168 0 168 168 168 0 0 168 168 0 168 168 168 168 168 168 168 168 168 168 168 144 168 168 0 0 93 168 168 168 0 168 168 168 168 168 168 168 168 168 0 168 168 168 88 0 145 0 168 168 168 142 0 168 168 168 168 168 0 168 168 168 168 168 142 0 168 0 0 168 168 168 168 168 4 0 9 168 168 168 168 168 0 34 168 0 150 121 40 0 168 168 168 168 168 168 168 168 168 168 168 168 37 0 150 0 0 168 168 53 168 0 168 168 168 168 168 168 168 0 168 0 168 157 0")

; assign to m the 20 20 reshape of v
(april "m←20 20 ⍴ v")

(april-f "m")

(write-array (april "m"))


; ⍉
; Transpose

(april "⎕←twenty_five_square←5 5 ⍴ ⍳25")

(april-f "twenty_five_square")

(april-f "⍉twenty_five_square")

(write-array (april "⍉m"))

; let's transpose the image of sia
(write-array (april "⍉img"))

(write-array (april "⍉⍉m"))

; ,  comma
; catenate

(april "20 30 40,sam")

;;;;;;;;;;;;;;;;;;;;;

; let's generate an image more programmatically

(april "a←?100 50 ⍴ 10")
(april "b←?100 50 ⍴ 50")
(april "c←?100 50 ⍴ 100")
(april "d←?100 50 ⍴ 255")
(april-f "a")
(april-f "a,b")
(april-f "⍉a")
(april "ac←⍉a,b,c,d")

(write-animated-gif (april "aa ab ac"))


(april "rv←255×¯1+?10⍴2")
(write-array (april "12 11 ⍴ rv"))

(april "rvfP←{$[0≡⊂⍵ ;
                ⊂255×¯1+?⍺⍴2 ;
                ⍵, ⊂255×¯1+?⍺⍴2 ]
             }")
(april "10 rvfP 0")
(write-animated-gif (april "{200 211 ⍴ ⍵}¨(10∘rvfP⍣20) 0"))


(write-array (april "rv←255×¯1+?10⍴2 ⋄ 11 11 ⍴ rv"))
(april "rvf⍣2 1")

(april "20 20∘⍴⊃ 20 rvfP 0" )


;;;;;;;;;;;;;;;;;;;;


; ⎕
; look

(april "⎕← 8 7 6" )

; ⋄
; end of expression

(april "1 ⋄ 2" )

(april "⎕←1 ⋄ 2" )

(april "⎕←1 ⋄ 2 ⋄ 99" )

; [ ]
; indexing

(april "sam[1]")

(april "⎕←m ⋄ 0")

(april "m[1;]")


; +/
; plus reduce
; plus "plop"

(april "+/1 3 5 7")

(april "+/sam")

; ⌈
; (monadic) round up
; (dyadic) maximum


(april "⌈4.2")

(april "9⌈8")

; ⌊

(april "⌊4.2")

; |
; remainder

(april "5|10")
; 10 divided by 5 is 2 and the remainder is 0

(april "5|9")
; 9 divided by 5 is 1 and the remainder is 4



; {}

; ⊂

; ⊃

; ∘.

; *


;;;;;;;;;;;;;;;
; some rotations, flips, etc.

(write-array (april "⊖img"))

(write-array (april "⌽img"))

(write-animated-gif (april "img (⌽img) (⊖img)"))
(write-animated-gif (april "img (100⌽img)"))
(write-animated-gif (april "img (100⌽img)"))
(april-f "5 5 ⍴ ⍳ 25")

(write-array (april "img,⌽img"))

(write-array (april "{⍵,[1]⊖⍵}img,⌽img"))

(write-array (april "{⍵,[1]⊖⍵} (¯230⌽img),230⌽⌽img"))


;;;;;;;;;;;;;;;




; if you want an information overload run this cell.
; it will tell you lots of information about the file "some.jpg"
(uiop:run-program "identify -verbose images/sia.png" :output t)


(write-array (april "⎕←100 100 ⍴ 100?200"))

(april "⎕←100 100 ⍴ 100?200")
; https://www.keyence.com/ss/products/auto_id/barcode_lecture/basic/mechanism/
; make a barcode?




;;;;;;;;;;;
(april-f "v←200×0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0⋄ m←5 6 ⍴ v ")
(april-f "m")
(write-array (april "m"))
(write-array (april-f "⌊({(+/+/÷×/∘⍴)⍵}⌺ 3 3) img"))
(april "(+/+/÷×/) 3 3 ⍴ ⍳9")
(april "(×/∘⍴) 3 3 ⍴ ⍳9")
(april "⌊3 3 ⍴ 4÷3")
;;;
(april "m")
;;;;;;;;;;;
(progn
  (april "m←img")
  ; (april "m←⌊(+/img)÷¯1↑⍴img")
  (april "res←{⍺,≢⍵} ⌸ ,m")
  (april-f "sorted←res[⍋⌽res;]")
  ; (april-f "sorted←res[⍒res;]")
  (april "values←sorted[⍳1⊃⍴sorted;1]")
  (april "counts←sorted[⍳1⊃⍴sorted;2]")
  0)
(write-array (april "(⍴m) ⍴ counts/values"))
;;;;;;;;;;;;;;;;;

; what color occurs most often?




; TODO note that the wet bandits, after sobel, seem to have 
; extra information. jpeg artifacts?

; edge detection

(april "one← ¯1  0  1")
(april "two← ¯2  0  2")
(april "thr← ¯1  0  1")

(april "⎕←kernel←3 3 ⍴ one,two,thr")

(april-f "kernelsum←1⌈|⌊+/+/kernel") ; the sum's absolute value

(april "⎕←g←⍉kernel")

(april-f "pairs←,(¯1+⍳(¯2+(⍴m)[1]))∘.,¯1+⍳(¯2+(⍴m)[2])")
(april "pairs[⍳10]")
(april "¯1+⍳(¯2+(⍴m)[2])")

(april "get_submats←{row←⍵[1]⋄col←⍵[2]⋄m[row+⍳3;col+⍳3]}")
(april-f "m[50;50]")
(april-f "get_submats 300 200")
;; here
(april-f "+/¨+/¨(⊂kernel)×sub_mats[1 2 3]")
(april-f "      (⊂kernel)×sub_mats[1 2 3]")

(flamegraph:save-flame-graph ("/mnt/mysobel.flame") 
                             (april "sub_mats←get_submats¨pairs"))

(april "Gx←(⊂kernel)×sub_mats") ; gradient in x
(april "Gx[1]")

(april "⍴m")
(write-array (april "littlem←(250⊖200⌽m)[⍳10;⍳10]"))
(april "{+/+/kernel×⍵}⌺3 3⊢m")
(april "{+/+/kernel×⍵}⌺3 3⊢m")
(april "⍴m")
(april "{+/+/kernel×⍵}⌺3 3⊢10 10 ⍴ ⍳100")
(defmacro bob (a)
  `(loop :for i :from 0 :to 1000
         :collect (progn 
                    (sleep 0.01)
                    (list ,a))))
(bob 88)
(flamegraph:save-flame-graph ("/mnt/some.flame") 
  (april "{+/+/kernel×⍵}⌺3 3⊢m"))
(april (:with (:compile-only)) "filteredx←{+/+/kernel×⍵}⌺3 3⊢m")
(april  "filteredx←{+/+/kernel×⍵}⌺3 3⊢m")
(april "⍴ filteredx")
(flamegraph:save-flame-graph ("/mnt/some.flame") 
  (blah))
;;;;;;;;;;;
; CL-USER> (defun foo ()
;            (sleep 0.01))
; FOO
; CL-USER> (defun bar ()
;            (sleep 0.05))
; BAR
; CL-USER> (defun blah ()
;            (loop repeat 1000
;                  do (foo)
;                     (bar)))
;;;;;;;;;;;
(april "filteredy←{+/+/g×⍵}⌺3 3⊢m")
(write-array (april "255⌊0⌈⌈filteredy÷kernelsum"))
(april "255⌊0⌈⌈filteredy÷kernelsum")
(write-array (april "255⌊0⌈⌈filteredx÷kernelsum"))
(april-f "kernel× 3 3 ⍴ ⍳9")
(april "⊢⌺3 3⊢littlem")
(april "+/,{+/+/⍵}⌺3 3⊢304 540 ⍴ ⍳20")
(april-f "⊢⌺3 3⊢6 5 ⍴ ⍳5")
(write-array (april "m"))
(ql:system-apropos "monitor")
(ql:quickload "cl-monitors")
(ql:quickload "chronicity")
(ql:system-apropos "oni")
(cl-monitors:monitor "ff" )
(ql:quickload :flamegraph)

  (april-f "Gy←(⊂g)×sub_mats")      ; gradient in y

  (april-f "filteredx ←(¯2+(⍴m)[1]) (¯2+(⍴m)[2]) ⍴ +/¨+/¨Gx")
(april "filteredx[1 2 3;]")

  (april-f "filteredy ←(¯2+(⍴m)[1]) (¯2+(⍴m)[2]) ⍴ +/¨+/¨Gy")

  ; now only keep if above a threshhold
  ; (april "filtered←filtered×filtered<150")
  ;

  ; sobel
  (april-f "final←((filteredx*2)+filteredy*2)*0.5")

(write-array
    (april "255⌊0⌈⌈final÷kernelsum"))

(april "final×final<50")
(write-array
    (april "255⌊0⌈⌈final×final>200÷kernelsum"))


(april "f←{⎕←⍵ ⋄ ⍵} ⋄ f\\1 2 3")
(april "f←{⍺,⍵} ⋄ f/1 2 3")

(write-array (april-c "{5 5 3 ↑⍵}" (opticl:read-png-file "./images/sia.png")))
(april-c "{⍴⍵}" (opticl:read-png-file "./images/sia.png"))
(april "(+/÷(¯1↑⍴)) 5 5 3 ⍴ ⍳75")
(april "5 5 3 ⍴ ⍳75")
(+ 1 2 (print (+ 3 3)))
(april "2 2⌷5 5 ⍴⍳50")
; +/⍵ ÷ ⍴⍵ 
(april (test))
(uiop:directory-files "." )
(let ((pid (sb-posix:getpid)))
  (uiop:run-program (format nil "cat /proc/~A/cmdline" pid)
                    :output t))

(remove-if #'evenp (alexandria:iota 50))
(delete-file )

(type-of (april::array-to-list *sia*))
(type-of *sia*)
