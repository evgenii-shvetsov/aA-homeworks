json.parties do 
    json.set! @party.id do
      json.id @party.id
      json.partial! "api/parties/party", party: @party
      json.extract! @party, :guest_ids, :gift_ids
    end
  end
  
  json.guests do
    @party.guests.each do |guest|
      json.set! guest.id do 
        json.id guest.id
        json.partial! "api/guests/guest", guest: guest
        json.gift_ids guest.gift_ids
      end
    end
  end
  
  json.gifts do
    @party.gifts.each do |gift|
      json.set! gift.id do 
        json.id gift.id
        json.partial! "api/gifts/gift", gift: gift
        json.party_id gift.party_id
        json.guest_id gift.guest_id
      end
    end
  end
  