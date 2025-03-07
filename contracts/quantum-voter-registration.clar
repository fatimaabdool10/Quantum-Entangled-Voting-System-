;; Quantum Voter Registration Contract

(define-map voters
  { id: uint }
  { quantum-state: (string-utf8 64) }
)

(define-data-var next-voter-id uint u0)

(define-public (register-voter (quantum-state (string-utf8 64)))
  (let
    ((new-id (var-get next-voter-id)))
    (var-set next-voter-id (+ new-id u1))
    (ok (map-set voters { id: new-id } { quantum-state: quantum-state }))
  )
)

(define-read-only (get-voter (id uint))
  (map-get? voters { id: id })
)

