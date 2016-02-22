module SalesTaxes

  # require
  LIB_DIR = File.dirname(__FILE__)
  require(File.join(LIB_DIR,'rounding.rb'))
  require(File.join(LIB_DIR,'sales_taxes/tax_info.rb'))
  require(File.join(LIB_DIR,'sales_taxes/item.rb'))
  require(File.join(LIB_DIR,'sales_taxes/receipt.rb'))

  extend self

  def read filename
    #remove first line
    items = File.readlines(filename).drop(1).map do |line|
      #validate line
      if !line.empty? || !line.nil?
        begin
          slice = line.split(",")
          {
            item: SalesTaxes::Item.new(name: slice[1].strip,price: slice[2]),
            quantity: slice[0].to_i
          }
        rescue
          puts "Error format"
          return
        end
      end
    end
    receipt = SalesTaxes::Receipt.new(items: items)
    receipt.display
  end

end
