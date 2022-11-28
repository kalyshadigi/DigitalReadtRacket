;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Assignment 11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 11 - List Abstractions
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

#| Question 1
Briefly state all of the list abstractions,
and what their purposes are
|#
#|
-map: Map applies a function to every element in a list.
-andmap: checks if every element in a list satisfies a predicate (function that contains a boolean).
-ormap: Ormap checks if any element in a list satisfies a predicate (function that contains a boolean).
-fold: Fold combines all the elements of a list into one element.
      -foldl: combines them from right to left
      -foldr: combines them from left to right
-filter: removes items from a list that dont satisfy the predicate (functoin that contains a booelan).
|#
#| Question 2
Remake the (list-product) function
from assignment 10 using list abstraction.
|#
;purpose: to make the list-product function easier to find
;signature: list-of-numbers -> numbers
(define (list-product afk)
  (foldr * 1 afk))
(check-expect(list-product (list 1 3 4)) 12)
(check-expect(list-product (list 2 3 4)) 24)
#| Question 3
Remake the (all-caps) function
from assignment 10 using list abstraction
|#
;porpuse: simplify the all caps function
;signature: list-of-strings -> list-of-strings
(define (all-caps str)
  (map string-upcase str))
(check-expect(all-caps (list "hello" "kitty"))(cons "HELLO" (cons "KITTY" '())))
(check-expect (all-caps (list "abc"))(cons "ABC"'()))

#| Question 4
Remake the (has-large-numbers?) function
from assignment 10 using list abstraction

Hint: You will need to make a helper function
|#
;purpose: simplify the has-;arge-numbers?
(define (has-large-numbers? jks)
  (ormap (> car jks 10)(> cdr jks 10)))
(check-expect(has-large-numbers? (list 13 7 8 4)) #t)
(check-expect(has-large-numbers?(list 2 4 5 2 3 4)) #f)
#| Question 5
Here is the student structure you made in assignment 10:
|# (define-struct student (name id grades)) #|
Remake the (get-gpa) function
from assignment 10 using list abstraction
|#

#| Question 6
Here is the classroom structure as defined in assignment 10:
|# (define-struct classroom (room teacher students)) #|
Remake the (filter-grades) function
from assignment 10 using list abstraction
|#