(while nil 动态储存分配，垃圾收集，运行时类型系统，函数对象，生成列表的内置解析器，一个接受列表形式的程序编译器，
  交互式环境等。
  fortran 使得编译器的作者更轻松，
  lisp    使得程序员的生活更舒服。
  两者定义了一个战场，一边的口号是：效率； 另一边是    ：抽象
  决定战场胜负的式硬件
  )
(while nil)
(defun double (x)
  (* x 2))
(double 2)
#'double
(eq #'double (car (list #'double)))
(list #'double)
#'(lambda (x) (* x 2))
(double 2)
((lambda (x) (* x 2)) 3)
(setq double 2)
(double (double double))
(symbol-value 'double)
(symbol-function 'double)
(setq x #'double)
(eq (symbol-value 'x) (symbol-function 'double))
(symbol-function 'double)
(setf (symbol-function 'double)
      #'(lambda (x) (* x 2)))
(defun double (x) (* x 2))
(apply '+ '(1 2))
(apply (symbol-function '+) '(1 2))
(apply #'(lambda (x y) (+ x y)) '(1 2))
(apply #'+ 1 2 '())
(funcall #'+ 1 2)
(mapcar #'(lambda (x) (+ x 10)) '(1 2 3))
(require 'cl-lib)
(defun mapcar* (f l1 l2)
  (if (= (length l1) (length l2))
      (if (= (length l1) 0)
          '()
        (cons (funcall f (car l1) (car l2))
              (mapcar* f (cdr l1) (cdr l2))))
    nil))
(mapcar* #'+ '(1 2 3) '(1 1 1))

(defun my-map (f l1 l2)
  (f l1 l2))

(my-map #'+ 1 2
 )

(remove-if #'evenp '(1 2 3 4 5 6 7))

(defun behave (animal)
(case animal
  (dog (wag-tail)
       (bark))
  (rat (scurry)
       (squeak))
  (cat (rub-legs)
       (scratch-carpet))))

(defun behave (animal)
  (funcall (get animal 'behavior)))
(setf (get 'dog 'behavior)
      #'(lambda ()
          (wag-tail)
          (bark)))
(let ((y 7))
  (defun scope-test (x)
    (list x y)))
(let ((y 5))
  (scope-test 3))

(defun list+ (lst n)
  (mapcar #'(lambda (x) (+ x n))
            lst))
(list+ '(1 2 3) 10)

(let ((counter 0))
  (defun new-id () (incf counter))
  (defun reset-id () (setq counter 0)))

(defun make-adder (n)
  #'(lambda (x) (+ x n)))

(setq add2 (make-adder 2)
      add10 (make-adder 10))

(funcall add2 5)
(defun make-adderb (n)
  #’(lambda (x &optional change)
      (if change
          (setq n x)
        (+ x n))))

(defun make-dbms (db)
  (list
   #'(lambda (key)
       (cdr (assoc key db)))
   #'(lambda (key val)
     (push (cons key val) db)
     key)
   #'(lambda (key)
     (setf db (delete key db :key #'car))
     key)))
(setq cities (make-dbms '((boston . us) (paris .france))))

(funcall (car cities) 'boston)
(defun 1+ (n) (+ n 1))
