## Image Processing with APL

Here an an example of some of the image processing we did in this course:

```lisp
(read-png "images/sia.png")
(april "f←{⍵ × (⍺ < ⍵) ∧ ((⍺+10) > ⍵)}")
(write-animated-gif (april "((10×⍳24),(⌽(10×⍳24))) f (⊂img)") 5)
```
![example](example3.gif)


[HERO Code Camp '22](https://theheracademy.org/hero-all-girl-code-camp-22/)

Thanks to [HER Academy](https://theheracademy.org/) and [Olive](https://oliveai.com/).
