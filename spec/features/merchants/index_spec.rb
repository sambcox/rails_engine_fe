require 'rails_helper'

RSpec.describe 'Merchants Index' do
  it 'Shows a list of each Merchant that are links to their show pages' do
    json_response = File.read('spec/fixtures/merchants.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants")
      .to_return(status: 200, body: json_response)

    visit merchants_path
    expect(page).to have_link("Schroeder-Jerde", href: merchant_path(1))
    expect(page).to have_link("Wisozk, Hoeger and Bosco", href: merchant_path(100))
    expect(page).to have_link("Gibson Group", href: merchant_path(44))
  end
end