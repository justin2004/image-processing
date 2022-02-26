

; y (april "littlem←(250⊖200⌽m)[⍳10;⍳10]"))
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



; if you want an information overload run this cell.
; it will tell you lots of information about the file "some.jpg"
(uiop:run-program "identify -verbose images/sia.png" :output t)

(april "10 ÷ 2 + 3")
