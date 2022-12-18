json.array! @gifts do |gift|
    json.partial! "api/gifts/gift", gift: gift
    json.party gift.party.name
  end
  

  