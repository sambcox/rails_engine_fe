class MerchantFacade
  def self.all_merchants
    merchants.map do |merchant|
      Merchant.new(merchant)
    end
  end

  def self.merchant(id)
    Merchant.new(parse_merchant(id))
  end

  private

  def self.parse_merchant(id)
    MerchantService.parse_response("#{id}")[:data]
  end

  def self.merchants
    MerchantService.parse_response('')[:data]
  end
end