json.array!(@availabilities) do |availability|
  json.extract! availability, :id, :teacher_id
  json.start availability.start_time
  json.end availability.end_time
  json.url teacher_availability_url(@teacher, availability, format: :html)
end
