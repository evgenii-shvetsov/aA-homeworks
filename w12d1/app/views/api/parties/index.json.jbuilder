json.array! @parties do |party|
    json.partial! "api/parties/party", party: party
    json.guests party.guests.map(&:name)
  end
  