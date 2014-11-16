 json.array! @statuses do |status|
    json.body status.body
    json.user_id status.user_id
  end