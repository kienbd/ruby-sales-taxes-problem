require "sales_taxes"


RSpec.describe SalesTaxes::Receipt do
  {
    "Input 1" => {
      items: [
        {item: {name: "book",price: 12.49},quantity: 1},
        {item: {name: "music cd",price: 14.99},quantity: 1},
        {item: {name: "chocolate bar",price: 0.85},quantity: 1}
      ],
      total: 29.83,
      total_taxes: 1.5
    },
    "Input 2" => {
      items: [
        {item: {name: "imported box of chocolates",price: 10.00},quantity: 1},
        {item: {name: "imported bottle of perfume",price: 47.50},quantity: 1},
      ],
      total: 65.15,
      total_taxes: 7.65

    },
    "Input 3" => {
      items: [
        {item: {name: "imported bottle of perfume",price: 27.99},quantity: 1},
        {item: {name: "bottle of perfume",price: 18.99},quantity: 1},
        {item: {name: "packet of headache pills",price: 9.75},quantity: 1},
        {item: {name: "box of imported chocolates",price: 11.25},quantity: 1}
      ],
      total: 74.68,
      total_taxes: 6.70
    }
  }.each do |input,test_case|
    describe "#total" do
      it "#{input} has total of #{test_case[:total]}" do
        items = test_case[:items].map do |item|
          {
            item: SalesTaxes::Item.new(item[:item]),
            quantity: item[:quantity]
          }
        end
        receipt = SalesTaxes::Receipt.new(items: items)
        expect(receipt.total).to eq test_case[:total]
      end
    end
    describe "#total_taxes" do
      it "and has sale taxes of #{test_case[:total_taxes]}" do
        items = test_case[:items].map do |item|
          {
            item: SalesTaxes::Item.new(item[:item]),
            quantity: item[:quantity]
          }
        end
        receipt = SalesTaxes::Receipt.new(items: items)
        expect(receipt.total_taxes).to eq test_case[:total_taxes]
      end
    end
  end
end

