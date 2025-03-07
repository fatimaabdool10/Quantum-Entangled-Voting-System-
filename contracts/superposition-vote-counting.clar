;; Superposition Vote Counting Contract

(define-map votes
  { id: uint }
  {
    ballot-id: uint,
    quantum-state: (string-utf8 64)
  }
)

(define-data-var next-vote-id uint u0)

(define-public (cast-vote (ballot-id uint) (quantum-state (string-utf8 64)))
  (let
    ((new-id (var-get next-vote-id)))
    (var-set next-vote-id (+ new-id u1))
    (ok (map-set votes
      { id: new-id }
      {
        ballot-id: ballot-id,
        quantum-state: quantum-state
      }
    ))
  )
)

(define-read-only (get-vote (id uint))
  (map-get? votes { id: id })
)

