unwind {batch} as _

merge (service:Service { id: _.service_id })
merge (instance:Instance { pid: _.pid, hostname: _.hostname } )
merge (instance)-[:INSTANCE_OF]->(service)
merge (instance)-[:HAS_RT_METRICS]->(rt:RtMetrics { status_code: _.status_code })
set rt.measured_at = _.measured_at,
 rt.count = _.count


