require 'rounding'

RSpec.describe "round up to 0.05" do
  {0.01 => 0.05,1.45 => 1.45,2.34 => 2.35,5.45 => 5.45,6564.435 => 6564.45,10.92 => 10.95,20.4165 => 20.45}.each do |num,rounded_num|
    it "#{num}.round_up_to(0.05) == #{rounded_num}" do
      expect(num.round_up_to(0.05)).to eq rounded_num
    end
  end
end
