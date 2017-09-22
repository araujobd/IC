; http://gist.github.com/jpzm/

;; Solução 2º Grau
;; Fatorial
;; Lista Encadeada
;; Enumerate
;; Sum

;; Solução 2º Grau
(defun baskara (a b c)
  (let ((delta 0) (x1 nil) (x2 nil))
   (setq delta (- (* b b)
                   (* 4 a c)))
    (if (>= delta 0)
      (progn
        (setq x1 (/ (+ (- b)
                       (sqrt delta))
                    (* 2 a)))
        (setq x2 (/ (- (- b)
                       (sqrt delta))
                    (* 2 a)))))
    (list x1 x2)))


;; Fatorial
(defun fatorial (n)
  (if (<= n 0)
    1
    (* n
       (fatorial (- n 1)))))


;; Fibonacci
(defun fibonacci (n)
  (if (or (= n 1) (= n 0))
    1
    (+ (fibonacci (- n 1))
       (fibonacci (- n 2)))))


;; Enumerate
(defun enumerate (x y)
  (loop for n from x to y
        when t
          collect n))


;; Sum of elements in List
(defun sum (lista)
  (let ((s 0))
    (loop for i in lista
          do
            (setq s (+ s i)))
    s))

;;(print (fibonacci (read)))
;;(print (fatorial (read)))
;;(print (baskara 2 2 2))
;;(print (enumerate 1 10))
;;(print (sum (enumerate 1 100)))

(terpri)
