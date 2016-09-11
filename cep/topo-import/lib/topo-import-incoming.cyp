unwind {batch} as _

merge (tgt:Service { id: _.target_service_id })
merge (src:Service { id:
  case
    when _.source_service_id = '' then
     'user'
    else
      _.source_service_id
  end })

merge (tgt_instance:Instance { pid: _.pid, hostname: _.target_hostname })

merge (tgt_instance)-[:INSTANCE_OF]->(tgt)

merge (tgt_instance)-[edge:INCOMING_FROM]->(src)

set edge.measured_at = _.measured_at,
  edge.protocol = _.protocol,
  edge.count = _.count,
  edge.transport_delay_in_median = _.transport_delay_in_median,
  edge.transport_delay_in_ninetyfive = _.transport_delay_in_ninetyfive



