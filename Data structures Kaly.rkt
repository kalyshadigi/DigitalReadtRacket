;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 7 - Structures
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

#| Question 1:
Define a new structure called "address"

An address should have a number, street, and town.

Follow the complete design recipe for data,
including a definition, interpretation,
and appropriate examples to recieve full credit.
|#
;address is a (make-address integer string string)
;address is a location where a person lives
;-number is the number of the house
;- street where they live at
;- town that they live in
(define-struct address ( number street town))
;Example
(define house (make-address 7 "Brighton" "Allston"))
(define loft (make-address 9 "Brighton" "Allston"))
(define apartment (make-address 6 "Harvard" "New Bedford"))
#| Question 2:
Fill in the blanks with the correct functions:
|#

; The function to create a new address is: make-address
; The function to access the number of an address is: address-number
; The function to access the street of an address is: address-street
; The function to access the town of an address is: address-town

#| Question 3:
If a house number is even, it is on the left side of the street.
If a house number is odd, it is on the right side of the street.

Make a function called "street-side" that takes in an address
and returns "Left" if the house is on the left side of the street,
and "Right" if the house is on the right side of the street.

Hint: You can use the functions (odd? num) or (even? num)
to determine is a number is even or odd.
|#
;purpose- to see if the house goes either on the left or the right
;signature- address-number -> string
(define (odd-even adr)
  (if (odd? (address-number adr))
      "right side of the street"
      "left side of the street"))
(check-expect(odd-even loft) "right side of the street")
(check-expect(odd-even apartment) "left side of the street")
#| Question 4:
Define a new structure called "Student"

A student should have a name, gpa and address.
|#
;student is a (make-student string number (make-address integer string string))
;student is a person that goes to school
;-name is the name of the student
;-gpa a number that collects how well in school they do
;-address where student lives
(define-struct student (name gpa address))
;examples
(define kaly (make-student "Kaly" 3.8 house))
(define pepe (make-student "Pepe" 2.1 loft))
(define jolia (make-student "Jolia" 4.0 apartment))
#| Question 5:
Two students are neighbors if they live on the same street
and within 20 house numbers of eachother.

Create a function called "neighbors?" that takes in two students
and returns if they are neighbors.
|#
;purpose- to know if the students are neighbours or not
;signature- address address -> boolean
(define (neighbors? stu1 stu2)
  (and (string=? (address-town(student-address stu1))(address-town(student-address stu2)))
           (< (address-number(student-address stu1))(address-number(student-address stu2)) 20)))

(check-expect(neighbors? "Kaly" "Pepe") #f)
(check-expect(neighbors? "Kaly" "Jolia") #t)
#| Bonus Question:
Create a structure called "coordinate"
that has an x value and y value.

Create a function called "distance-formula"
that takes in two coordinates and calculates
the distance between them.

Hint: If two points are (x1, y1), (x2, y2),
the distance between them is
(sqrt ((x2 - x1)^2 + (y2 - y1)^2))
|#