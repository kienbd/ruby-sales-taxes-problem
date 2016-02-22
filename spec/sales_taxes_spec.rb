require "sales_taxes"

RSpec.describe SalesTaxes do

  before(:example) do
    @test_cases = {
      "input1.txt" => {
        items: [
          {item: {name: "book",price: 12.49},quantity: 1},
          {item: {name: "music cd",price: 16.49},quantity: 1},
          {item: {name: "chocolate bar",price: 0.85},quantity: 1}
        ],
        total: 29.83,
        total_taxes: 1.5
      },
      "input2.txt" => {
        items: [
          {item: {name: "imported box of chocolates",price: 10.50},quantity: 1},
          {item: {name: "imported bottle of perfume",price: 54.65},quantity: 1},
        ],
        total: 65.15,
        total_taxes: 7.65

      },
      "input3.txt" => {
        items: [
          {item: {name: "imported bottle of perfume",price: 32.19},quantity: 1},
          {item: {name: "bottle of perfume",price: 20.89},quantity: 1},
          {item: {name: "packet of headache pills",price: 9.75},quantity: 1},
          {item: {name: "box of imported chocolates",price: 11.85},quantity: 1}
        ],
        total: 74.68,
        total_taxes: 6.70
      }
    }
  end

  it "reads input from file and give correct ouput" do
    @test_cases.each do |input,output|
      expect(SalesTaxes::read input).to eq output
    end

  end

end
