json.array!(@bookings) do |booking|
  json.extract! booking, :id, :teacher_id
  json.start booking.start_time  
  json.end booking.end_time
  json.url teacher_bookings_url(@teacher, booking, format: :html)
end
