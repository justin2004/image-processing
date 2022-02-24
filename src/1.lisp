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

;;;;
; BEGIN
; - Goals
; - Errors will happen (show some)
; - Ask me to walk through
; - use paper and pencil
; - start with a small version of the problem
; 
; Where to learn about functions?
; - e.g. if you want to learn about ⊂
;   - Go to tryapl.org and type: ]help ⊂
;;;;
; END
; - Use it regularly
;   - Instead of using a calculator for math hw use APL 
; - community? orchard.
;;;;


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
;   Dyalog APL, GNU APL, and April APL

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

(april "smile←200 × 5 6 ⍴ 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0")

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
(april "img[200;230]")
; the 200th row
; the 230th column

; let's look at one row of pixels
(april "img[1;]")


; let's modify the image by only keeping pixel values
; greater than 150
(write-array (april "img × img > 150"))



; Terms
;
; We need to learn some words used in APL

; Scalar
(april "3")

; Vector
(april "2 4 6 8")

; Matrix a.k.a "array"  a.k.a "grid"

(april-f "4 4 ⍴ 1 2 3" )

; Function and Operands:
(april "8 - 3")
; - is the function
; 8 is the function's left operand
; 3 is the function's right operand

; Monadic Function

(april "÷ 9")
; mon-  mono-
; : one : single : alone 
;
; monadic functions take a single operand

; Dyadic Function

(april "4 + 6")
; dyad
; : pair
;
; dyadic functions take two operands


; Please Excuse My Dear Aunt Sally?

; Order of Operations in APL:
; 
; right to left
; and
; the space between vectors items are strong!
;
; you can use parentheses to force an order
; 

; right to left
(april "10 ÷ 2 + 3")

; parens force order
(april "(10 ÷ 2) + 3")

; the space between vectors items are strong
(april "10 + 1 2 3")

(april-f "(10 + 1 2) 3")



; ⍴ is a greek letter 
; pronounced "row" 
; spelled "rho"
;
; dyadic  ⍴ is the "reshape" function
; monadic ⍴ is the "shape"   function


; "what is the shape of the 4 4 reshape of 1 2 3"
(april  "⍴4 4 ⍴ 1 2 3" )

; "what is the shape of the shape of the 4 4 reshape of 1 2 3"
(april "⍴⍴4 4 ⍴ 1 2 3" )

; we need to spend some time with the reshape function
;   let's do it a little later



; Dimensions, Rank, Shape

; spaces don't matter between functions and their operands
(april "⍴ 3")

(april "⍴3")

(april "⍴ 2 4 6 8")

(april "⍴2 4 6 8")

(april "(⍴ 2 4) 6 8")

(april "⍴⍴ 2 4 6 8")




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



; You might hear me use these terms:

; Nested

; Item

; Axis



; Functions and Operators

; ←
; assignment

(april "sam←50 100 200")

(april "sam")

; what do you think this will do?
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



; ⍉
; Transpose

(april "twenty_five_square←5 5 ⍴ ⍳25")

(april-f "twenty_five_square")

(april-f "⍉twenty_five_square")

(write-array (april "smile"))

(write-array (april "⍉smile"))

; let's transpose the image of sia
(write-array (april "⍉img"))

(write-array (april "⍉⍉smile"))

; ,  comma
; dyadic , is the catenate function
; monadic , is the ravel function

(april "20 30 40 , sam")

(april "20 30 40 sam")

(april ", smile")

;;;;;;;;;;;;;;;;;;;;

; let's make a mask
(write-array (april "img"))
(write-array (april "mask←img<20"))
(write-array (april "mask×255"))

; and use the mask
(write-array (april "one←mask×?(⍴img) ⍴ 255"))
(write-array (april "two←mask×?(⍴img) ⍴ 255"))
(write-animated-gif (april "img one two"))

;;;;;;;

(read-png "images/Dua_Lipa.png")
(read-png "images/Columbus-Skyline.png")
(write-array (april "img"))
(april "masks←(⊂img)<20 40 60 40")
(april "masks←(⊂img)<20 40 60 100 150 200 255")
(write-animated-gif (april "masks×⊂img"))
(write-array (april "255×neon_mask←170<img"))
(write-array (april "255⌊img+neon_mask×255"))
; (april-f "4 5 6 (,⍤1 0) 3 3 ⍴ ⍳9")
; (april-f "4 5 6 , 3 3 ⍴ ⍳9")


;;;;;;;;;;;;;;;;;;;;;

; let's generate an image more programmatically

; TODO

(april "a←?100 50 ⍴ 10")
(april "b←?100 50 ⍴ 50")
(april "c←?100 50 ⍴ 100")
(april "d←?100 50 ⍴ 255")
(april "aa←⍉a,b,c,d")

(write-animated-gif (april "aa ab ac"))


;;;;;;;;;;;;;;;;;;;;

; function definition
; {}

(april "15 {⍺+⍵} 10 20 30")

(april "15 {⍺<⍵} 10 20 30")



;;;;;;;;;;;;;;;;;;;;

; convolution kernels

(april-f "⎕←m←4 4 ⍴ ⍳25")
(april-f "+/+/m")
(april-f "({⍵}⌺ 3 3) m")
(april "⎕←kernel←3 3 ⍴ 0 ¯1 0 ¯1 5 ¯1 0 ¯1 0")
(april-f "({+/+/⍵}⌺ 3 3) m") ; adding up all cells in the matrix
(write-array (april-f "255⌊({+/+/⍵}⌺ 3 3) img")) ; adding up all cells in the matrix
(april-f "result←({+/+/kernel×⍵}⌺ 3 3) img ⋄ 0"); sharpen kernel
(write-array (april "0⌈255⌊result"))
(april-f "result1←({+/+/kernel×⍵}⌺ 3 3) (225⌊result) ⋄ 0"); sharpen kernel
(april-f "result2←({+/+/kernel×⍵}⌺ 3 3) (225⌊result1) ⋄ 0"); sharpen kernel
(april-f "result3←({+/+/kernel×⍵}⌺ 3 3) (225⌊result2) ⋄ 0"); sharpen kernel
(write-array (april "0⌈255⌊result3"))
(write-array (april "small←100 100 ↑ img"))
(write-array (april "small"))
(write-animated-gif (april "img (0⌈255⌊result) (0⌈255⌊result1) (0⌈255⌊result2)")) ; clamp
;;;;;; line detection
(april "img")
(april "⎕←kernel←3 3 ⍴ ¯1 2 ¯1 ")
(time (april "done←({0⌈255⌊+/,⍵×kernel}⌺ 3 3) img"))
(write-array (april "done"))
;
;;;;;;;;;;;;;;;;;;;;
(april "gaussBlur←{kernel←3 3 ⍴ 1 2 1 2 4 2 1 2 1
                   ({255⌊0⌈⌊(+/,kernel × ⍵)÷16}⌺ 3 3) ⍵
                  }")
(april-f "gaussBlur 3 3 ⍴ ⍳9")
;;;;

(read-png "images/twitter_photo1_sm.png")
; how many pixel values are greater than 50?
(april "+/,img>50")
; how many pixel are there? 
; what percentage of pixel values are greater than 50? 
(april "⌊100×(+/,img>50)÷×/⍴img")

(april "⎕←kernelA←3 3 ⍴ ¯1 2 ¯1 ")
(april "up←img×img>100")
(april "r←({255⌊|+/+/kernelA×⍵}⌺3 3) gaussBlur up ⋄ 0")
(april "r←({255⌊|+/+/kernelA×⍵}⌺3 3) img ⋄ 0")
(write-animated-gif (april "img r"))
(write-array (april "255⌊⌈3.0×r"))
(write-array (april "r×(gaussBlur r)>50"))
;;;;
; https://web.archive.org/web/20121005005358/http://williamson-labs.com/convolution-2d.htm

; high pass mask
(time (april "kern←3 3 ⍴ ¯1 ¯1 ¯1 ¯1 9 
       r←{+/,kern × ⍵}⌺ 3 3 ⊢ img ⋄ 0"))
(write-animated-gif (april "(img) (0⌈255⌊r)"))
; low pass filter
(april-f "kern←3 3 ⍴ (4 ⍴ ÷16),(÷2)")
(time (april "r←{+/,kern × ⍵}⌺ 3 3 ⊢ img ⋄ 0"))
(write-array (april "⌊0⌈255⌊r"))
(time (april "rr←{+/,kern × ⍵}⌺ 3 3 ⊢ r ⋄ 0"))
(time (april "rrr←{+/,kern × ⍵}⌺ 3 3 ⊢ rr ⋄ 0"))

(write-animated-gif (april "(img) (⌊0⌈255⌊r) (⌊0⌈255⌊rr) (⌊0⌈255⌊rrr)"))

;edge detector
(april-f "kern←3 3 ⍴ ¯1 ¯1 ¯1 ¯1 8")
(time (april "r_edge←{+/,kern × ⍵}⌺ 3 3 ⊢ img ⋄ 0"))
(write-array (april "⌊255⌊0⌈r_edge"))
(write-array (april "(⊢×(200∘<)) (255⌊0⌈r)"))
;   ×⍨⍤50∘<  ⍵


(april "{+/,(3 3 ⍴ ¯1 ¯1 ¯1 ¯1 9) × ⍵}⌺ 3 3 ⊢ img")
(april-f "3 3 ⍴ ¯1 ¯1 ¯1 ¯1 9 ")

;;;;
;
(april-f "kernelB←⍉kernelA")
(april-f "kernelC←¯1 0 1⌽kernelA")
(april-f "kernelD←⌽¯1 0 1⌽kernelA")
;
(april "img←?3 3 ⍴ 255")
(april-f "({+/+/⍵}⌺3 3) img")
(april-f "kernelA kernelB kernelC kernelD × ⊂img")
(april-f "255⌊|+/¨+/¨kernelA kernelB kernelC kernelD × ⊂img")
; (april-f "⍴({255⌊|+/¨+/¨kernelA kernelB kernelC kernelD × ⊂⍵}⌺3 3) img")
(april-f "({+/+/¨kernelA kernelB kernelC kernelD × ⊂⍵}⌺3 3) img")
(april-f "({kernelA kernelB kernelC kernelD × ⊂⍵}⌺3 3) img")
(april-f "({kernelA kernelB × ⊂⍵}⌺3 3) img")
(april-f "({kernelA kernelB (⊣×⊂⍤⊢) ⍵}⌺3 3) img")
;              ⍺×⊂⍵
; ⍺ ( gh)⍵→   g(⍺h⍵)  ⍝ dyadic  atop)
; ⍺ (fgh)⍵→  (⍺f⍵) g(⍺h⍵)  ⍝ dyadic  fgh fork)
(april "2 3 (⊣×⊂⍤⊢) 4 5")
(april "2 3 ×∘⊂ 4 5")
(april "2 3 (⊣(+/×)⊂⍤⊢) 4 5")
(april "2 3 ⊂⍤⊢ 4 5")
(april "2 3 (⊂⊢) 4 5")
(april-f "({+/+/kernelA × ⍵}⌺3 3) img")
(format t "~@r~%" 123)
(format t "~r~%" 123)
(april-f "m←2 3 3 ⍴ ⍳ 18")
(april-f "(1⌷m) (2⌷m)")
(april "count←⊃⍴m")
(april "≢ 8 3 3 ⍴ 0")
(april-f "(⍳≢) ∘.⌷ ⊂m ")
;      (∘.⌷∘⊂)
(april-f "(⍳∘≢(∘.⌷)⊂) m")
(april-f "(⍳∘≢∘.⌷⊂) m")

(april-f "⊃1 1 ↑'(÷' '(-' ∘., 1 2 3 ∘., ')'")
; (fgh)⍵→   ( f⍵) g( h⍵)  ⍝ monadic fgh fork)
(april "(-,[0.5]÷) 1 2 3")
(april "'(÷',' 1)'")
(april "'(÷ 1) (÷ 2)'")
(april "img←?2 2 ⍴ 255 ")
(time (april "result←({+/+/⍵×kernel}⌺3 3) img"))
(write-array (april "255⌊|result"))
(april "")

(write-array (april "255×img<155"))
;;;;;;;;;;;;;;




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
;;;;;;;;;

(april "-⍤÷4")      ⍝ (  f⍤g y) ≡  f   g y
(april "-∘÷4")      ⍝ (  f⍤g y) ≡  f   g y
(april "-÷")
¯0.25
      12 -⍤÷ 4   ⍝ (x f⍤g y) ≡ (f x g y)
¯3
      3 1 4 1 5 ~⍤∊ 1 2 3
0 0 1 0 1

; ≠a / a
(april "(≠(⊢⍤/)⊢) 1 2 3 3 2 4")
(april "(≠⊢⍤/⊢) 1 2 3 3 2 4")

; rank selects a trailing subset of axes.
;   apply function on those cells

; equiv
(april-f "(⊖⍤1) 2 3 6 ⍴ ⍳72")
(april-f "⌽ 2 3 6 ⍴ ⍳72")

(april-f "(⊖⍤2) 2 3 6 ⍴ ⍳72")

(april-f "3 6 ⍴ ⍳72")
(april-f "(⊖⍤1) 2 3 6 ⍴ ⍳72")

(april-f "  2 3 6 ⍴ ⍳72")
(april-f "⊖ 2 3 6 ⍴ ⍳72")
(april-f "⌽ 2 3 6 ⍴ ⍳72")

(april-f "⌽ 2 3 ⍴ ⍳72")
(april-f "⊖ 2 3 ⍴ ⍳72")

(april-f "2 3⍴⍳100") ; r c
(april-f "2 3 4⍴⍳100") ; v r c

(april "size←10 ⋄ m← size size ⍴ ⍳size×size ⋄ 0")
(april-f "⎕←m←3 3 4 ⍴ '33'")
(april "(⌽m) ≡ (⊖⍤1)m")
(time (april "⌽m "))
(time (april "(⊖⍤1)m "))
(april "6.024÷0.079")
; 7.5E¯8
(setf one (* 7.5 (expt 10 -8)))
; 2.5E¯7
(setf two (* 2.5 (expt 10 -7)))
(- (* 100  (/ two one)) 100)
(* one 2.33 )
  0.079 seconds of real time
  6.024 seconds of real time
(- (* 100 (/ 6.024 0.079)) 100)
(* 0.079  75.25316)

(april-f "3 3 ⍴ ⍳16")
(april "+⌿ 3 3 ⍴ ⍳16")
(april "size←1000 ⋄ m← size size ⍴ ⍳size×size ⋄ 0")
(sb-ext:gc :full t )
(time (april "(+⌿⍤1) m ⋄ 0"))
(time (april "+/ m ⋄ 0"))

(april-f "(⊖⍤1) 2 3 ⍴ ⍳50")
(april-f "⌽ 2 3 ⍴ ⍳50")
(ql:quickload :flamegraph)
(ql:system-apropos "flame")

(flamegraph:save-flame-graph ("/mnt/reverse.flame")
  (april "⌽m ⋄ 0"))

(flamegraph:save-flame-graph ("/mnt/reverse_rank.flame")
  (april "(⊖⍤1)m ⋄ 0"))

(uiop:run-program "ls -la /mnt" :output t)

(defun bob ()
  (april:april ",m ⋄ 0"))

(bob)

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

; ⌸ key
(april-f "res←{⍺ (≢⍵)}⌸ ,img")
(april-f "⎕←res[⍒res[;2];]⋄0")
(write-array (april "sr←img[⍋img[1;]]"))
(write-array (april "img[⍋img[1;]] ,[1] ¯299↑img"))
(write-array (april "↑⍋¨↓img[⍳10;] ,[1] ¯290↑img")) ; what is this?
(write-array (april "↑⍋¨↓img[⍳10;]"))
(write-array (april "img[⍳2;]"))
(april-f "target←2 2 ⍴ ⍳4")
(april "rearr←2 2 ⍴ 2 1 2 1")
(april-f "target[rearr]")

(write-array (april "↑⍋¨↓img[⍳2;]"))
(april "img[1 2;]")
(april "⍴img")
(april-f "0 11 22 ,[1] 3 3 ⍴ ⍳ 9")

(progn
  ; (april "m←img")
  (april "m←smile")
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(april "⍴(⍳2)∘.× ⍬ ∘.× (⍳4)")
(april "⍴+⌿(⍳2)∘.× ⍬ ∘.× (⍳4)")
(april "+⌿+⌿(⍳2)∘.× ⍬ ∘.× (⍳4)")
(april "a←(⍳2)∘.× ⍬ ∘.× (⍳4)")
(setf aa (april "a"))
(april-c "{⍴⍵}" aa)
(type-of aa)
(april "⍬≡1↓'a'")
(april "⍬≡''")

(april "⍬∘., 1 2 3")

(type-of (april "⍬ ∘.× (⍳4)"))
(type-of (april "(⍳2)∘.× ⍬ ∘.× (⍳4)"))
(type-of (april "+⌿(⍳2)∘.× ⍬ ∘.× (⍳4)"))
(april-f "⍳2 3")

(april "⍬≡1↓'apple'")
(april "⍬≡1↓1↑4↓1↓'apple'")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(uiop:run-program "ls -la /home/containeruser/quicklisp" :output t )
(load "/home/containeruser/quicklisp/local-projects/april/demos/ncurses/loader.lisp")
(load "/home/containeruser/quicklisp/local-projects/april/demos/ncurses/loader.lisp")
(ql:quickload "croatoan")

(april-f "+/3 2 ⍴ 1 2 3 (⊂4 5)")

(april "2 ,⍥÷ 5")
(april "5⍨ 2 6")
(april "7 (5⍨) 2 6")
(april "(×/÷⊢) 1 2 3 4 5")




; blur the result?
(april-f "⊢kernel←3 3 ⍴ 0 ¯1 0 ¯1 5 ¯1 0 ¯1 0")
(april "res←{(+/÷≢),⍵}⌺3 3⊢mask×255")
(april "boxBlur←{(⌊+/÷≢),⍵}⌺3 3")
(write-array (april "res"))
(april "(+/÷≢),3 3 ⍴ ⍳9")
(april "'APPLE'∊13↑⎕a")
(write-array (april "{0⌈255⌊+/,kernel×⍵}⌺3 3⊢⌊res"))

(write-array (april "boxBlur img"))
