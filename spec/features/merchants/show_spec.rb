require 'rails_helper'

RSpec.describe 'Merchants Index' do
  it 'Shows a specific merchant' do
    json_response = File.read('spec/fixtures/merchant_1.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants/1")
      .to_return(status: 200, body: json_response)

    json_response = File.read('spec/fixtures/merchant_1_items.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants/1/items")
      .to_return(status: 200, body: json_response)

    visit merchant_path(1)
    expect(page).to have_content("Schroeder-Jerde")
    expect(page).to_not have_content("Wisozk, Hoeger and Bosco")
  end

  it 'Shows a specific merchants items' do
    json_response = File.read('spec/fixtures/merchant_1.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants/1")
      .to_return(status: 200, body: json_response)

    json_response = File.read('spec/fixtures/merchant_1_items.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants/1/items")
      .to_return(status: 200, body: json_response)

    visit merchant_path(1)
    expect(page).to have_content("Item Nemo Facere")
    expect(page).to have_content("Item Ea Voluptatum")
    expect(page).to have_content("Item Quidem Suscipit")
  end
end