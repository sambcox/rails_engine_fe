class MerchantsController < ApplicationController
  def index
    @merchants = MerchantFacade.all_merchants
  end

  def show
    @merchant = MerchantFacade.merchant(params[:id])
    @items = ItemFacade.items_by_merchant(@merchant.id)
  end
end