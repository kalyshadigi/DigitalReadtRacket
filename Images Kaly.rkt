;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 8 (1)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 8 - Images
Submit on Google Classroom by the end of class.

If a question asks you to make a function,
it must follow the complete design recipe
including a purpose statement, signature
and appropriate tests to recieve full credit

If a question asks you to make a structure,
it must follow the complete design recipe
including a definition, interpretation,
and appropriate examples to recieve full credit
|#

; For this assignment, we will be making
; an image of a snowman.
(require 2htdp/image)

#| Question 1:
Make a solid white circle with a radius of 50

Save this circle as a variable called "base"
|#
(define base (circle 50 "solid" "white"))
#| Question 2:
Make an outlined black circle with a radius of 5

Save this circle as a variable called "eye"
|#
(define eye (circle 5 "outline" "black"))
#| Question 3:
Using the overlay function, place the nose defined
below on top of "base". Save this overlay as
a variable called "no-eyes".
|#
(define nose (isosceles-triangle 30 330 "solid" "orange"))
(define no-eyes (overlay nose base))
#| Question 4:
Using the place-image function, place
two eyes on "no-eyes". Save the image
with both eyes placed as "head"

Hint: One eye should be placed at (30, 30),
one eye should be placed at (70, 30)
|#
(define head (place-image eye 30 30 (place-image eye 70 30 no-eyes)))
#| Question 5:
Create your snowman!

Using the "above" and "scale" functions,
place the head on top of a base that is scaled
by 1.5, and another base that is scaled by 2.

Save this image as "snowman"
|#
(define snowman (above
                head (scale 1.5 base)(scale 2 base)))
#| Question 6:
Make a solid circle of radius 7 of any color you'd like.
Save that circle as a variable called "button"

Using (place-image), place the buttons on your snowman
in any way you'd like. Save the final product
as "final-snowman"
|#
(define button (circle 7 "solid" "Red"))
(define final-snowman(place-image button 100 120(place-image button 100 160(place-image button 100 200 snowman))))
#| Bonus Question:
Give your snowman a hat!

Assemble a hat using any combination
of shapes, then use "above"
to place it on your snowman.
|#
(define rectangle(ellipse