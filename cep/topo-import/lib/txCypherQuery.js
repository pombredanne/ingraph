'use strict'

const stream = require('highland')

module.exports = function txCypherQuery (db) {
  return function (handle) {
    let tx = null
    return (err, x, push, next) => {
      let errorEpilog = (err) => {
        console.log(err)
        push(err)
        next()
        push(null, stream.nil)
      }
      if (err) {
        errorEpilog(err)
      } else if (x === stream.nil) {
        if (!tx) {
          push(null, x)
        } else {
          tx.commit((err) => {
            if (err) {
              errorEpilog(err)
            } else {
              push(null, x)
            }
          })
        }
      } else {
        if (!tx) {
          tx = db.beginTransaction()
        }
        if (tx.state !== tx.STATE_OPEN) {
          errorEpilog(new Error(`Expected tx state to be ${tx.STATE_OPEN}, but it is ${tx.state}`))
        } else {
          const cb = (def) => {
            tx.cypher(def, (err, result) => {
              if (err) {
                errorEpilog(err)
              } else {
                push(null, {
                  query: def,
                  result
                })
                next()
              }
            })
          }
          handle(x, cb)
        }
      }
    }
  }
}
