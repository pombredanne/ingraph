'use strict'

const fs = require('fs')
const path = require('path')

module.exports = {
  query: fs.readFileSync(path.join(__dirname, 'topo-import-rt.cyp'), { encoding: 'utf8' }),
  columns: [
    'id',
    'measured_at',
    'status_code',
    'count',
    'account_id',
    'service_id',
    'hostname',
    'pid'
  ]
}
