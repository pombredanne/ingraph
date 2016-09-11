# Trace analysis tools for neo4j

[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg)](http://standardjs.com/)


## Install
```
hub clone szarnyasg/neo4j-tinkerpop3
cd neo4j-tinkerpop3/topo-import
npm install
```

# Try out on test data
```
node index.js --auth neo4j:admin lib/topo-import-external.js  test-data/external
node index.js --auth neo4j:admin lib/topo-import-incoming.js  test-data/incoming
node index.js --auth neo4j:admin lib/topo-import-rt.js  test-data/rt
```

Should work like a charm.
