json.partial! "api/gifts/gift", gift: @gift
json.guest @gift.guest.name
json.party @gift.party.name

