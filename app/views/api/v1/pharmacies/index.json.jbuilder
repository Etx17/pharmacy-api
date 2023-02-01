json.array! @pharmacies do |pharmacy|
  json.extract! pharmacy, :id, :name
end
