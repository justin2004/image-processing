; Welcome to a Jupyter notebook!

; Why are we in a Jupyter notebook?
; 
; We will be learning, editing, and running code in this notebook.


; What is Jupyter?
;
; Computational Notebook (notebooks for code)

; What can you do in a Jupyter notebook?
; 
; - look at code
; - edit the code
; - run the code
; - look at the results of running the code

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
; you have to run this cell in order to use April


; - Goals for this class
;
; - Errors will happen often
;
; - Ask me to walk through things
;
; - Use paper and pencil
;
; - Start with a small version of the problem
; 
; - Make changes in the notebook!
;   - Add cells and change existing cells
;
; - Learning
;   - if you want to learn about, for example, ⊂
;     go to tryapl.org and type: ]help ⊂
;   - Dyalog APL Tutor
;     - https://tutorial.dyalog.com/
;
; - Use APL regularly
;   - Instead of using a calculator for math homework use APL!
;
; - Ask questions and discuss
;   - The APL Orchard is a friendly place ask questions about APL 
;     - https://apl.chat/


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

; APL is a general purpose programming langauge but it happens to be
; really good at working with images

; What are images?
 
; Is this an image?
(april-f "0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 0 0")

; ...about April
; notice the -f
;
; think about the -f as meaning "friendly" output

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
;
; This is called "greyscale"


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
; but you can use parentheses to force an order
; 

; right to left
(april "10 ÷ 2 + 3")

; parens force order
(april "(10 ÷ 2) + 3")

; the space between vectors items are strong
(april "10 + 1 2 3")

(april "(10 + 1) 2 3")




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





; You might hear me use these terms:

; Nested

; Item

; Axis



; Functions and Operators

; ←
; assignment function

(april "sam ← 50 100 200")

(april "sam")

; what do you think this will do?
(april "sam ÷ 2")

; ⍳ "iota"
; index generator function

(april "⍳9")

; ⍴  "rho"
; shape of function
; monadic ⍴ tells you the shape of something

(april "⍴ 2 4 6 8 10")

(april "⍴ sam")

; dyadic ⍴ reshapes
(april "15 ⍴ sam")
; Read as: "15 reshape sam" makes a vector 15 items long using sam


; ≢
; tally function

; Let's look it up 
; go to tryapl.org and type: ]help ≢



; ⍉
; Transpose function

(april "twenty_five_square ← 5 5 ⍴ ⍳ 25")

(april-f "⍉ twenty_five_square")

; let's transpose the image of sia
(write-array (april "⍉ img"))

; transpose two times?


; ,  comma
; dyadic , is the catenate function
; monadic , is the ravel function

(april "20 30 40 , sam")

(april "20 30 40 sam")

(april ", smile")



; let's make a mask
(write-array (april "img"))

(write-array (april "mask ← img < 20"))

(write-array (april "mask × 255"))

; and use the mask
(write-array (april "one ← mask × ?(⍴img) ⍴ 255"))

(write-array (april "two ← mask × ?(⍴img) ⍴ 255"))

(write-animated-gif (april "img one two"))


; animation with masks

(read-png "images/Dua_Lipa.png")

(read-png "images/Columbus-Skyline.png")

(read-png "images/sia.png")

(write-array (april "img"))

(april "masks ← ( ⊂ img ) < 20 40 60 40")

(april "numberSteps ← 20")

(april "stepSize ← ⌈ 255 ÷ numberSteps")

(april "stepSequence ← ⌽ stepSize × ⍳ numberSteps")

(april "masks ← ( ⊂ img ) < stepSequence ")

(write-animated-gif (april "masks × ⊂ img"))
; try to delete the ⊂ in this cell 



; function definition
; {}

(april "15 {⍺+⍵} 10 20 30")

(april "15 {⍺<⍵} 10 20 30")

(april-f "{3 3 ⍴ ⍵} ⍳10")



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

(april "m←3 3 ⍴ ⍳ 9")

(april "m[1;]")

(april "(4 4 ⍴ ⍳ 16) [1;]")


; +/
; plus reduce
; plus "plop"

(april "+/1 3 5 7")

(april "sam ← 10 20 30")

(april "+/sam")

; ×/
; multiply reduce
; muitiply "plop"

(april "×/1 3 5 7")

(april "sam ← 10 20 30")

(april "×/sam")

; ⌈
; (monadic) round up
; (dyadic) maximum


(april "⌈4.2")

(april "9⌈8")

; ⌊

(april "⌊4.2")

(april "2.5⌊4.2")

; |
; remainder

(april "5|10")
; 10 divided by 5 is 2 and the remainder is 0

(april "5|9")
; 9 divided by 5 is 1 and the remainder is 4




; some rotations, flips, etc.

(write-array (april "⊖img"))

(write-array (april "⌽img"))

(write-animated-gif (april "img (⌽img) (⊖img)"))

(write-animated-gif (april "img (100⌽img)"))

(write-animated-gif (april "img (100⌽img)"))

(write-array (april "img,⌽img"))

(write-array (april "{⍵,[1]⊖⍵}img,⌽img"))

(write-array (april "{⍵,[1]⊖⍵} (¯230⌽img),230⌽⌽img"))




; convolution kernels
; using the stencil function:  ⌺

(april "⎕ ← m ← 4 4 ⍴ ⍳ 25")

(april-f "({⍵}⌺ 3 3) m")

(april-f "({+/,⍵}⌺ 3 3) m") ; adding up all cells in each matrix

(write-array (april "img"))

; adding up all cells in each matrix 
; then reduce to 255 if greater (clamping)
(write-array (april-f "255⌊({+/,⍵}⌺ 3 3) img"))

; sharpen kernel
(april "⎕←kernel←3 3 ⍴ 0 ¯1 0 ¯1 5 ¯1 0 ¯1 0")

(april-f "result←({+/+/kernel×⍵}⌺ 3 3) img ⋄ 0")

(write-array (april "0⌈255⌊result"))

; let's sharpen a few times then animate

(april-f "result1←({+/+/kernel×⍵}⌺ 3 3) (225⌊result) ⋄ 0")

(april-f "result2←({+/+/kernel×⍵}⌺ 3 3) (225⌊result1) ⋄ 0")

(april-f "result3←({+/+/kernel×⍵}⌺ 3 3) (225⌊result2) ⋄ 0")

; first, look at the final result 
(write-array (april "0⌈255⌊result3"))

(write-animated-gif (april "img (0⌈255⌊result) (0⌈255⌊result1) (0⌈255⌊result2)")) 


; line detection

(write-array (april "img"))

(april "⎕←kernel←3 3 ⍴ ¯1 2 ¯1 ")

(april "done←({0⌈255⌊+/,⍵×kernel}⌺ 3 3) img ⋄ 0")

(write-array (april "done"))

; guassian blur in a function

(april "gaussBlur←{kernel←3 3 ⍴ 1 2 1 2 4 2 1 2 1
                   ({255⌊0⌈⌊(+/,kernel × ⍵)÷16}⌺ 3 3) ⍵
                  }")

(april-f "gaussBlur 3 3 ⍴ ⍳9")

(write-array (april-f "gaussBlur img"))

; apply it twice

;;;;;;;;;

(read-png "images/twitter_photo1_sm.png")

; how many pixel values are greater than 50?

; how many pixel are there? 

; what percentage of pixel values are greater than 50? 
(april "⌊100×(+/,img>50)÷×/⍴img")

; what color occurs most often?
(april "{⍺ (≢⍵)}⌸ ,img")

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

(april "r_edge←{+/,kern × ⍵}⌺ 3 3 ⊢ img ⋄ 0")

(write-array (april "⌊255⌊0⌈r_edge"))

(write-array (april "(⊢×(200∘<)) (255⌊0⌈r)"))

(april "{+/,(3 3 ⍴ ¯1 ¯1 ¯1 ¯1 9) × ⍵}⌺ 3 3 ⊢ img")

(april-f "3 3 ⍴ ¯1 ¯1 ¯1 ¯1 9 ")



; ⌸ key

(april "⎕←m←5 5 ⍴ ⍳20")

(april-f "{⍺ (≢⍵)}⌸ ,m")

(progn
  (april "m←img")
  ; (april "m←smile")
  ; (april "m←⌊(+/img)÷¯1↑⍴img")
  (april "res←{⍺,≢⍵} ⌸ ,m")
  (april-f "sorted←res[⍋⌽res;]")
  ; (april-f "sorted←res[⍒res;]")
  (april "values←sorted[⍳1⊃⍴sorted;1]")
  (april "counts←sorted[⍳1⊃⍴sorted;2]")
  0)

(write-array (april "(⍴m) ⍴ counts/values"))





; blur the result?
(april-f "⊢kernel←3 3 ⍴ 0 ¯1 0 ¯1 5 ¯1 0 ¯1 0")
(april "res←{(+/÷≢),⍵}⌺3 3⊢mask×255")
(april "boxBlur←{(⌊+/÷≢),⍵}⌺3 3")
(write-array (april "res"))
(april "(+/÷≢),3 3 ⍴ ⍳9")
(april "'APPLE'∊13↑⎕a")
(write-array (april "{0⌈255⌊+/,kernel×⍵}⌺3 3⊢⌊res"))

(write-array (april "boxBlur img"))
