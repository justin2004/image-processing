## Image Processing with APL

Here an an example of some of the image processing we did in this course:

```lisp
(read-png "images/sia.png")
(april "f←{⍵ × (⍺ < ⍵) ∧ ((⍺+10) > ⍵)}")
(write-animated-gif (april "((10×⍳24),(⌽(10×⍳24))) f (⊂img)") 5)
```
![example](example3.gif)


[HERO Code Camp '22 Recap]()
```
HER Academy and Olive recently partnered to bring you our second HERO Code Camp, expanded to include students in grades 5-12. More than 50 girls registered! Check out the recap video with highlights from the final day.
```

Thanks to [HER Academy](https://theheracademy.org/) and [Olive](https://oliveai.com/).
