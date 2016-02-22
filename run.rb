$LOAD_PATH << "./lib"
require "sales_taxes"


def main
  filename = ARGV[0]||"input1.txt"
  SalesTaxes::read(filename)
end

main
