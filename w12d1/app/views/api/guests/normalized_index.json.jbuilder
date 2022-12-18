json.guests do
    @guests.each do |guest|
      json.set! guest.id do 
        json.id guest.id
        json.partial! "api/guests/guest", guest: guest
        json.gift_ids guest.gift_ids
      end
    end
  end
  