(defconstant *X* 'X)
(defconstant *O* 'O)
(defconstant *_* '_)
(defconstant *winplaces* '( (0 1 2) (3 4 5) (6 7 8)
                            (0 3 6) (1 4 7) (2 5 8)
                            (0 4 8) (2 4 6)  ))

(defclass player ()
  ((mark :accessor player-mark
         :initform *X*
         :initarg :mark)
   (move :accessor player-move
         :initform 'human-play
         :initarg :move)))

(defclass board ()
  ((state :accessor board-state
          :initform (make-list 9 :initial-element *_*)
          :initarg :state)
   (current :accessor current-player
            :initform 'x
            :initarg :current)))

;; Retorna o jogador adversário
(defmethod opponent (player)
  (if (equal player *X*)
    *O*
    *X* ))

;; Retorna as posições vazias
(defmethod empty-places (state)
  (loop for place in state
    and index from 0
    when (eql place '_)
      collect index ))

;; Jogada aleatória
(defmethod random-move (state discard)
  (setq *random-state* (make-random-state t))
  (let ((places (empty-places state)))
  (nth (random (length places)) places) ))

;;winner
(defmethod winner (state)
  (let (a b c)
    (loop for i in *winplaces* do
      (setf a (nth 0 i))
      (setf b (nth 1 i))
      (setf c (nth 2 i))
      (if (and (not (eq (nth a state) *_*))
               (eq (nth a state) (nth b state))
               (eq (nth a state) (nth c state)))
        (return (nth a state))  ))))

;;draw
(defmethod draw? (state)
  (= (length (empty-places state)) 0) )

(defmethod final? (state)
  (if (or (not (null (winner state)))
          (draw? state) )
    t
    nil ))
