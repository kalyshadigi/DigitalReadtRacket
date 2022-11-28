;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 9 - Big Bang Project|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 9 - Big Bang Project
Submit on Google Classroom by Wednesday at 5:00PM

If a question asks you to make a function,
it must follow the complete design recipe
including a purpose statement, signature
and appropriate tests to recieve full credit

If a question asks you to make a structure,
it must follow the complete design recipe
including a definition, interpretation,
and appropriate examples to recieve full credit
|#

#|
For this assignmnet,you will make a simple game called "Parachute".
In "Parachute", you control a parachuter falling
from the top of the screen. At the bottom of the
screen, there is a platform that automatically moves
from left to right. Your goal is to land
on this platform to win.
|#

; These libraries are required for big-bang
; and image processing
(require 2htdp/universe)
(require 2htdp/image)

#| Problem 1:
Design data for a "parachuter".
A parachuter will need a current x,y position.
|#
;parachuter is a (make-parachuter number number)
;a parachuter represents the main character of a game
;-x is the parachuters x position
;-y is the parachuters y position
(define-struct parachuter (x y))
;example
(define exam-parachuter (make-parachuter 500 750))
#| Problem 2:
Design data for a "platform".
Since the platform only moves from left to right,
it will only need an x position. Also include
a boolean called "left?" that is #true if the
platform is currently moving to the left,
and #false if the platform is currently moving
to the right. This will make our on-tick functionality
much easier later.
|#
;platform is a (make-platform num bool)
;represents the platform in parachuter
;-x is the platforms x position
;-bool tells you if the platform is moving to the left
(define-struct platform (x left?))
;example
(define exam-platform( make-platform 750 #t))
#| Question 3
Design data for a "World"
that contains the parachuter and the platform.
|#
;world is a (make-world parachuter platform)
;represents the games state
;-parachuter is the parachuter in the world
;-platform is the platform in the world
(define-struct world (parachuter platform))
(define WORLD-START (make-world parachuter-start platform-start))
;example
(define para-plat (make-world exam-parachuter exam-platform))
#| Question 4
Design your "on-key" function.
If you press "left" on your keyboard,
the parachuter should move to the left.
If you press "right" on your keyboard,
the parachuter should move to the right.

You will need to include code to prevent
your parachuter from going beyond the
edges of the screen. i.e., if your parachuter
is already hugging the left side of the screen,
they should not be allowed to move any
further left, and vice versa for the right side.
|#
;purpose: to know if you pressed right key or left key
;signature key -> number
;implementation
(define (move-parachuter world key)
  (cond
    [(key=? key "left") (make-world
                         (make-parachuter
                          (- 1 ( parachuter-x
                                 (world-parachuter world)))
                          (parachuter-y (world-parachuter world)))
                         (world-platform world))]
    [(key=? key "right")(make-world
                         (make-parachuter
                          (+ 1 (parachuter-x
                                (world-parachuter world)))
                          (parachuter-y (world-parachuter world)))
                         (world-platform world))]
    [ else world]))


#| Question 5:
Design your "on-tick" function.

Every tick, the parachuter should descend one pixel downwards.

Every tick, the platform should move one pixel
in the direction it is currently moving.

If the platform collides with a wall, its direction
should be reversed.
|#
(define (collision platform wall)
  (= (platform-x platform) wall))
(define (tick-world world)
  (cond
   [(collision (platform-x 
    (make-world (
#| Question 6:
Design your "to-draw" function.

The game should be rendered on a white
background that is 500x1000 pixels large,
as has been defined below.

The game should render the parachuter
at its current x,y position and the platform
at its current x position and constant height.

Define sprites for the parachuter and platform
to use in your drawing.
|#
(define BACKGROUND (empty-scene 500 1000))
m
#| Question 7:
Design your "stop-when" function.
The game should stop if the parachuter successfully
lands on the platform OR if the parachuter misses
the platform.
|#

#| Question 8:
Design an end-scene function to
display when the game is over.

If the parachuter landed on the platform,
it should display "You Win!".

If the parachuter misses the platform,
it should display "You Lose!".
|#

#| Question 9
Create your big-bang function.
Name the function "parachute"
and place all your handler functions
in the appropriate spaces.
|#

#| Question 10
Play your game!
Make starter data including a
starting parachuter towards the top
of the screen and a starter
platform at the middle of the screen.
Make a starter world that contains
your parachuter and platform
and play your game.
|#

#| Bonus
Add additional features to your game!
- Add a number of lives to your world.
  If the player loses but still has more lives,
  get rid of one life and respawn the parachuter
  at the top of the screen.
- Add a score counter to your world.
  Add a point every time the parachuter successfully lands
- Add any additional features you can think of! Examples:
  - Multiple platforms
  - Obstacles for the parachuter to avoid
  - A modifier for the parachuter's speed.
    (if holding a key, the left/right movement is faster)
|#