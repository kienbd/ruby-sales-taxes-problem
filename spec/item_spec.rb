require "sales_taxes"


RSpec.describe SalesTaxes::Item do
  [
    {item: {name: "book",price: 12.49}, tax: 0,exempt: true,imported: false},
    {item: {name: "music cd",price: 14.99}, tax: 1.5,exempt: false,imported: false},
    {item: {name: "chocolate bar",price: 0.85}, tax: 0, exempt: true,imported: false},
    {item: {name: "imported box of chocolates",price: 10.00},tax: 0.5,exempt: true,imported: true},
  ].each do |test_case|
    context "#{test_case[:item][:name]} with price of #{test_case[:item][:price]}" do
      describe "#exempt?" do
        it "returns true if item's name has a exempt keyword" do
          item = SalesTaxes::Item.new(test_case[:item])
          expect(item.exempt?).to eq test_case[:exempt]
        end
      end
      describe "#imported?" do
        it "returns true if item's name has a imported keyword" do
          item = SalesTaxes::Item.new(test_case[:item])
          expect(item.imported?).to eq test_case[:imported]
        end
      end
      describe "#tax" do
        it "calculate tax" do
          item = SalesTaxes::Item.new(test_case[:item])
          expect(item.tax).to eq test_case[:tax]
        end
      end
    end
  end

end

