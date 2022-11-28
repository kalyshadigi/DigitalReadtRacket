;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Assignment 12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 12 - Local and Lambda
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
Remake the (has-large-numbers?) function
from assignment 11 using list abstractions
AND a lambda expression
|#
;purpose: simplify past code made in th elast assigment
;signature: list-of-numbers-> boolean
(define (has-large-numers? lon)
  (ormap(λ (num)(> num 10)) lon))
(check-expect(has-large-numbers?(list  10 13 19)) #t)
              
#| Question 2
Create a function that filters a list of
numbers to include numbers that are both
odd and negative. Use a lambda expression.

For example,
(filter-neg-odds (list -1 2 -3 -4 5)) -> (list -1 -3)
|#
;purpose find the negative and odd numbers of the list
;signature: list-of-numbers -> list-of-numbers
(define (odd-negative lon)
  (filter (λ(num)(and(odd? num)(negative? num))) lon))
(check-expect (odd-negative (list 1 2 -3 4 -5)) (list -3 -5))
#| Question 3
Create a function that takes in a list of strings
and maps the following function to the list:

If the string is 3 or less characters long,
turn it into "Short Word"

If the string is between 3 and 8 characters long,
turn it into "Medium Word"

If the string is longer than 8 characters long,
turn it into "Long Word".

Create a local scope and define your helper
function within that local scope.
|#
;purpose: find out the type of words the list contains
;signature: list-of-strings -> list of strings
(define (map-word-length los)
  (local
    [(define (word-length str)
       (cond
         [(<= (string-length str) 3) "Short Word"]
         [(and (>( string-length str) 3) (<= (string-length str) 8)) "Medium Word"]
         (else "Long Word")))]
         (map word-length los)))
(check-expect(map-word-length (list "hi" "you" "bro")) (list "Short Word" "Short Word" "Short Word"))
(check-expect(map-word-length (list "yes" "what" "Thanksgiving")) (list "Short Word" "Medium Word" "Long Word"))
#| Question 4
A company wants to create a program
that will check if a passphrase inputted
by the user is correct.

The company wants to make sure the
passphrase is only accessible in this function,
so that the passphrase can't be found
in any other part of the code.

Create a funcion that takes in a string
and checks if it matches the passphrase.

Define your passphrase within a local scope.
|#
;purpose: checks phrasses the user place are right
;signature: list-of-strings ->