json.array! @laboratories do |laboratory|
  json.extract! laboratory, :id, :name, :city
end
