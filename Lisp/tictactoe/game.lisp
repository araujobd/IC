(load "utils.lisp")
(load "ai-based-rules.lisp")
(load "ai-minimax.lisp")

(defmethod print-board (state)
  (terpri)
  (format t "   0 | 1 | 2    #    ~A | ~A | ~A~%" (nth 0 state) (nth 1 state) (nth 2 state))
  (format t "   3 | 4 | 5    #    ~A | ~A | ~A~%" (nth 3 state) (nth 4 state) (nth 5 state))
  (format t "   6 | 7 | 8    #    ~A | ~A | ~A~%" (nth 6 state) (nth 7 state) (nth 8 state))
  (terpri))

(defmethod play ((b board))
  (let ((pos (funcall (player-move (current-player b)) (board-state b) (player-mark (current-player b)))))
    (if (member pos (empty-places (board-state b)))
      (setf (nth pos (board-state b)) (player-mark (current-player b)))
      (print "NOT VALID") )))

(defmethod turn ((b board) (x player) (o player))
  (if (eql (current-player b) x)
    (setf (current-player b) o)
    (setf (current-player b) x) ))

(defmethod game-over ((b board))
  (let ((result (winner (board-state b))))
    (if (null result)
      (format t "~%  Draw!!!~%")
      (format t "~%  Player ~A Won!!!~%" result)  )))

(defun in-list? (pos state)
  (cond ((null (member pos state))
          (write-line "Try Again!")
          nil)
        (t t) ))

(defun human-move (state discard)
  (let (pos (places (empty-places state)))
    (loop
      (setf pos (read))
      (when (in-list? pos places) (return pos))  )))


(defmethod game ((playerx player) (playero player))
  (let ((myboard (make-instance 'board :current playerx)))
    (print-board (board-state myboard))
    (loop
      (format t "_______________________")
      (format t "~%Player ~A it's your move!~%~%" (player-mark (current-player myboard)))
      (play myboard)
      (turn myboard playerx playero)
      (print-board (board-state myboard))
      (when (final? (board-state myboard)) (return (game-over myboard)))  )))

;; OPTIONS
;; * human-move
;; * random-move
;; * ai-minimax-move    .obs:. minimax as playero is bugged
;; * ai-based-rules-move
(defvar x (make-instance 'player :mark *X* :move 'ai-minimax-move ))
(defvar o (make-instance 'player :mark *O* :move 'ai-minimax-move ))

(game x o)

(terpri)
