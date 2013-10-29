(define (third l)
  (car (cdr (cdr l))))

(define (sum-from-to a b)
  (cond
   ((> a b) 0)
   (else (+ a (sum-from-to (+ a 1) b)))))
(sum-from-to 2 2)
(display
 (call-with-current-continuation
  (lambda (kont)
    (kont (+ 5 3)))))
(define a '(1 2 3 4 5))
(define b '(1 b 2 e f))
(define (square-list the-list)
  (call-with-current-continuation
   (lambda (early-exit-k)
     (map
      (lambda (x)
        (if (number? x)
            (* x x)
            (early-exit-k '*error*)))
      the-list))))
(display (square-list a))
(display (square-list b))
(newline)
(let* ((yin
        ((lambda (cc)
           (display #\@) cc)
         (call/cc
          (lambda (c) c))))
       (yang
        ((lambda (cc)
           (display #\*) cc)
         (call/cc
          (lambda (c) c)))))
  (yin yang))
(define return #f)
(+ 1 (call/cc
      (lambda (cont)
        (set! return cont))))
(return 3)
