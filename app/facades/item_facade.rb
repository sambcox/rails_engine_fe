class ItemFacade
  def self.items_by_merchant(merchant_id)
    parse_merchant_items(merchant_id).map do |item|
      Item.new(item)
    end
  end

  private

  def self.parse_merchant_items(merchant_id)
    ItemService.parse_merchant_item_response(merchant_id)[:data]
  end
end