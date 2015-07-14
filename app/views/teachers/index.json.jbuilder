json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :first_name, :last_name, :description, :price, :skype, :qq, :country, :subject
  json.url teacher_url(teacher, format: :json)
end
