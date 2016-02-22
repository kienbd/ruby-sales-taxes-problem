module SalesTaxes

  class Item
    include SalesTaxes::TaxInfo

    attr_accessor :name,:price

    def initialize attrs
      @name = attrs[:name]
      @price = attrs[:price].to_f
    end

    def exempt?
      # check if name include exempted keywords
      if (name.split(" ") & TAX_EXEMPT_ITEM_KEYWORDS).empty?
        return false
      else
        return true
      end
    end

    def imported?
      # check if name include imported keywords
      if (name.split(" ") & IMPORTED_ITEM_KEYWORDS).empty?
        return false
      else
        return true
      end
    end

    def tax
      rate = 0
      rate += BASIC_TAX   if !exempt?
      rate += IMPORT_DUTY if imported?
      (price * rate).round_up_to(0.05)
    end

    def total_price
      (price + tax).round(2)
    end
  end
end
