;(load "utils.lisp")
(load "database.lisp")

(defvar state)
(defvar me)

; Retorna o elemento da posição pos
(defun element (pos)
  (nth pos state) )

; Verifica se a posição é do jogador adversário
(defun a (pos)
  (equalp (element pos) (opponent me))  )

; Verifica se a posição é do jogador ai-based-rules
(defun m (pos)
  (equalp (element pos) me)  )

; Verifica se a posição é vazia
(defun v (pos)
  (equalp (element pos) *_*)  )

; Jogada do ai-based-rules
(defmethod ai-based-rules-move (stat mark)
  (setq me mark)
  (setq state stat)
  (loop for rule in database do
        (if (eval (car rule))
          (return-from ai-based-rules-move (car (cdr rule)))  ))
  (random-move state me) )
