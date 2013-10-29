(define square (lambda (x) (* x x)))
(define my-test-data '(1 2 3 4 5 5))
(define list-of-squares (map square my-test-data))
(begin
  (display list-of-squares)
  (newline))
(define make-echo-function
  (lambda (x)
    (lambda ()
      x)))
(define echo1 (make-echo-function 1))
(define echo2 (make-echo-function 2))
(begin (display (echo1))
       (newline))
(begin (display (echo2))
       (newline))

(define make-counter
  (lambda (curval)
    (lambda ()
      (set! curval (+ curval 1))
      curval)))
(define my-counter (make-counter 0))
(begin (display (my-counter))
       (newline))
(define filter-evens
  (lambda (the-list)
    (let (
          (new-list '()))
      (for-each
       (lambda (entry)
         (if (even? entry)
             (set! new-list (cons entry new-list))
             #f))
       the-list)
      new-list)))
(begin (display (filter-evens '(1 2 3 4 5)))
       (newline))
(define filter
  (lambda (filter-func the-list)
    (let (
          (new-list '()))
      (for-each
       (lambda (entry)
         (if (filter-func entry)
             (set! new-list (cons entry new-list))
             (void)))
       the-list)
      new-list)))
(define number-list '(1 2 3 4 5 6 7 8 9))
(display (filter even? number-list))
(newline)
(display (filter odd? number-list))
(display (filter (lambda (x) (< x 5)) number-list))
(define make-counter
  (lambda (value)
    (vector
     (lambda ()
       (set! value (+ value 1))
       value)
     (lambda (new-value)
       (set! value new-value)
       value))))
(define nextValue (lambda (obj) (vector-ref obj 0)))
(define setValue (lambda (obj) (vector-ref obj 1)))
(define my-counter (make-counter 3))
(display ((nextValue my-counter)))
(define port (open-file "/home/zengfb/Code/scheme/a.txt" "r"))
(read port)


