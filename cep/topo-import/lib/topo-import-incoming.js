'use strict'

const fs = require('fs')
const path = require('path')

module.exports = {
  query: fs.readFileSync(path.join(__dirname, 'topo-import-incoming.cyp'), { encoding: 'utf8' }),
  columns: [
    'id',
    'account_id',
    'measured_at',
    'pid',
    'target_hostname',
    'protocol',
    'source_service_id',
    'target_service_id',
    'count',
    'transport_delay_in_median',
    'transport_delay_in_ninetyfive'
  ]
}
