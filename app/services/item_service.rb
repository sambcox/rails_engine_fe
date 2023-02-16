class ItemService
  def self.parse_merchant_item_response(merchant_id)
    JSON.parse(response("merchants/#{merchant_id}/items").body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: 'http://localhost:3000/api/v1')
  end

  def self.response(uri)
    connection.get(uri)
  end
end