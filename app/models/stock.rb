class Stock < ActiveRecord::Base
  
  def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    #I didn't need the below method. Mine was working fine without having to strip the commas.
    #price = strip_commas(looked_up_stock.latest_price)
    new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
  end
  
  #This method doesn't work because it doesn't like the gsub method on the number
  def self.strip_commas(number)
    number.gsub(",", "")
  end
  
end
