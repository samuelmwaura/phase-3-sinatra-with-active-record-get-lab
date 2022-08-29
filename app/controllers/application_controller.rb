class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get("/bakeries") do
    Bakery.all.to_json #This will get the data from the db,parse to Json and the method returns the data implicitly
  end
  
  get('/bakeries/:id') do
   id = params[:id] #fetching the dynamic information from the url
   Bakery.find(id).to_json(include: :baked_goods)
  end

  get('/baked_goods/by_price') do
  baked_goods =  BakedGood.order(price: :desc) #fetch from the db in the descending order of prices.
  baked_goods.to_json #implicitly return this value
  end

  get('/baked_goods/most_expensive')do
  #gets the goods with the most expensive price using where
  #select the first one 0r
  #get all baked_goods order by price desc and return the first one
  most_expensive_good = BakedGood.where(price: BakedGood.maximum(:price)).first #.frist because where returns an array
  most_expensive_good.to_json
  # most_expensive_good = BakedGood.order(price: :desc).first #Gets the highest value of price and returns that good
  # most_expensive_good.to_json
  end
  

end
