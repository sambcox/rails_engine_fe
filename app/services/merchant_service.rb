class MerchantService
  def self.connection
    Faraday.new(url: 'http://localhost:3000/api/v1/merchants')
  end

  def self.parse_response(uri)
    JSON.parse(response(uri).body, symbolize_names: true)
  end

  def self.response(uri)
    connection.get(uri)
  end
end