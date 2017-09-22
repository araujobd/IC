;(load "utils.lisp")
(defvar hash)

;; check if player won
(defun player-win? (state mark)
  (eq (winner state) mark)  )

;; check if is final
(defun final? (state)
  (if (or (not (null (winner state)))
          (draw? state) )
    t
    nil ))

;; calculate the utility of state
(defun calc-utility (state mark depth maxplayer?)
  (cond ((player-win? state mark)
          (if maxplayer?
            (- 10 depth)
            (- depth 10)  ))
        (t 0) ))

;; set utility of state in hash
(defun set-utility (state hash value)
  (setf (gethash state hash) value) )

;; find all states
(defmethod searchm (state mark depth maxplayer?)
  (let (clone)
    (cond ((final? state)
            (set-utility state hash (calc-utility state (opponent mark) depth (not maxplayer?)))  )
          (t
            (loop for i in (empty-places state) do
              (setf clone (copy-list state))
              (setf (nth i clone) mark)
              (setf (gethash clone hash) 0)

              (searchm clone (opponent mark) (+ depth 1) (not maxplayer?))
              (if (null (gethash state hash))
                (setf (gethash state hash) 0) )
              (set-utility state hash (+ (gethash clone hash)
                                         (gethash state hash))) )))))

;; return the key it has max value
(defun max-value (hash)
  (let (key (m -9999999999))
    (maphash #'(lambda (k v)
                 (cond ((> v m)
                        (setq key k)
                        (setq m v))))
             hash )
    key ))

;; return the key it has min value
(defun min-value (hash)
  (let (key (m 9999999999))
    (maphash #'(lambda (k v)
                 (cond ((< v m)
                        (setq key k)
                        (setq m v))))
             hash )
    key ))

;; return the position of minimax move
(defmethod ai-minimax-move (state mark)
  (let ((empty (empty-places state))
        (hash-next (make-hash-table :test 'equal))  )
    (setf hash (make-hash-table :test 'equal))
    (searchm state mark 0 t)

    (loop for i in empty do
      (setf (nth i state) mark)
      (setf (gethash i hash-next) (gethash (copy-list state) hash))
      (setf (nth i state) *_*)  )
    (max-value hash-next) ))
