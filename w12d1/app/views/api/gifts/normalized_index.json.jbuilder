json.gifts do
    @gifts.each do |gift|
      json.set! gift.id do 
        json.id gift.id
        json.partial! "api/gifts/gift", gift: gift
        json.party_id gift.party_id
        json.guest_id gift.guest_id
      end
    end
  end
  