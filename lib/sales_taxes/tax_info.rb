module SalesTaxes
  module TaxInfo
    # Tax rates
    BASIC_TAX = Float(10)/100
    IMPORT_DUTY = Float(5)/100

    # Exempted item keywords
    BOOK_ITEM_KEYWORDS = ["book"]
    FOOD_ITEM_KEYWORDS = ["chocolate","chocolates"]
    MEDICAL_ITEM_KEYWORDS = ["pill","pills"]
    TAX_EXEMPT_ITEM_KEYWORDS = BOOK_ITEM_KEYWORDS + FOOD_ITEM_KEYWORDS  + MEDICAL_ITEM_KEYWORDS


    # Imported item keywords
    IMPORTED_ITEM_KEYWORDS = ["imported"]
  end
end
