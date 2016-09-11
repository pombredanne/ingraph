#!/usr/bin/env node

'use strict'

const program = require('commander')
const pkg = require('./package.json')
const neo4j = require('neo4j')
const fs = require('fs')
const _ = require('lodash')
const stream = require('highland')
const path = require('path')
const repartition = require('highland-repartition')
const txCypherQuery = require('./lib/txCypherQuery')

const defaults = {
  neoHost: 'http://localhost:7474'
}

program
  .version(pkg.version)
  .usage('[options] model input_files...')
  .option('-H, --host [host]', `hostname and port for neo4j. Default: ${defaults.neoHost}`, defaults.neoHost)
  .option('-a, --auth [user:pass]', 'username and password. Format: user:pass')
  .parse(process.argv)

if (program.args.length < 2) {
  console.error('Invalid number of arguments')
  process.exit(1)
}

const db = new neo4j.GraphDatabase({
  url: program.host,
  auth: program.auth
})

const trimQuotes = (str) => {
  str = str.trim()
  if (str.startsWith('"')) {
    str = str.slice(1)
  }
  if (str.endsWith('"')) {
    str = str.slice(0, -1)
  }
  return str
}

const assignNames = (columns) => (acc, x, i) => {
  var obj = {}
  obj[columns[i]] = x
  return _.assign(obj, acc)
}

const def = require(path.resolve(program.args[0]))

stream(program.args.slice(1))
  .map((f) => stream(fs.createReadStream(f)))
  .sequence()
  .map((buf) => buf.toString('utf8'))
  .consume(repartition(
    (str) => stream(str.split(/\n/)),
    (str1, str2) => str1 + str2
  ))
  .map((x) => x.trim())
  .filter((x) => x.length)
  .map((x) => x.split(',').map(trimQuotes).reduce(assignNames(def.columns), {}))
  .batch(10000)
  .consume(txCypherQuery(db)((x, query) => {
    return query({
      query: def.query,
      params: { batch: x }
    })
  }))
  .scan(0, (acc, x) => acc + x.query.params.batch.length)
  .each((c) => console.log(c || 0))
