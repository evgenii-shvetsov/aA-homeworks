# json.array! @guests do |guest|
#  json.extract! guest, :name, :age, :favorite_color
# end

# Using partial
json.array! @guests do |guest|
    next unless guest.age.between?(40, 50)
    json.partial! "api/guests/guest", guest: guest  
  end