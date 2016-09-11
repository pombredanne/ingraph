'use strict'

const fs = require('fs')
const path = require('path')

module.exports = {
  query: fs.readFileSync(path.join(__dirname, 'topo-import-external.cyp'), { encoding: 'utf8' }),
  columns: [
    'id',
    'account_id',
    'measured_at',
    'pid',
    'source_hostname',
    'protocol',
    'source_service_id',
    'target_id',
    'count',
    'status_ok',
    'status_not_ok',
    'response_time_median',
    'response_time_ninetyfive'
  ]
}
