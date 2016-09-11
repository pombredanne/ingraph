unwind {batch} as _

merge (ext:External { address: _.target_id })
merge (service:Service { id: _.source_service_id })
merge (instance:Instance { pid: _.pid, hostname: _.source_hostname } )
merge (instance)-[:INSTANCE_OF]->(service)
merge (instance)-[edge:EXTERNAL_EDGE]->(ext)
set edge.measured_at = _.measured_at,
  edge.protocol = _.protocol,
  edge.count = _.count,
  edge.status_ok = _.status_ok,
  edge.status_not_ok = _.status_not_ok,
  edge.response_time_median = _.response_time_median,
  edge.response_time_ninetyfive = _.response_time_ninetyfive


