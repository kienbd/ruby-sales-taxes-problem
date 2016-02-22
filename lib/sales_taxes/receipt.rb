
module SalesTaxes

  class Receipt

    include SalesTaxes::TaxInfo

    attr_accessor :items

    # {items: [{item: @item_instance,quantity: 1}]}
    def initialize attr={}
      @items = attr[:items]||[]
    end

    # {item: @item_instance,quantity: 1}
    def add_item data
      @items << data
    end

    def total
      items.inject(0) {|result,item_slot| result += item_slot[:item].total_price* item_slot[:quantity].to_i}.round(2)
    end

    def total_taxes
      items.inject(0) {|result,item_slot| result += item_slot[:item].tax* item_slot[:quantity].to_i}.round(2)
    end

    def display
      #print to console
      printf "====RECEIPT====\n"
      printf "%-10s%30s%20s\n", "Quantity","Product","Price"
      output_items = []
      items.each do |item_slot|
        printf "%-10d%30s%20.2f\n", item_slot[:quantity],item_slot[:item].name,item_slot[:item].total_price
        output_items << {item: {name: item_slot[:item].name,price: item_slot[:item].total_price },quantity: item_slot[:quantity]}
      end
      printf "\n---------\n"
      printf "%-20s: %.2f\n", "Sales Taxes"     , total_taxes
      printf "%-20s: %.2f\n", "Total"           , total


      # ouput
      {items: output_items,total: total,total_taxes: total_taxes}
    end
  end

end
