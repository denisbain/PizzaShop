#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base
end
class Order < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

post '/cart' do

	@orders_input = params[:orders]
	@items = parse_orders_input @orders_input

	@items.each do |item|
		product_id = item[0].to_i
		product = Product.find(product_id)
		item[0] = product.id if product # Убедитесь, что продукт найден
	end


	erb :cart
end

post '/place_order' do


	order_params = params[:order]

	# Создание нового заказа в базе данных
	order = Order.create(
		name: order_params[:name],
		phone: order_params[:phone],
		address: order_params[:address]
	)

	# Добавление элементов заказа к заказу
	@items.each do |item|
		product_id = item[0].to_i
		quantity = item[1].to_i
		product = Product.find(product_id)
		order.order_items.create(product: product, quantity: quantity) if product
	end

	erb :cart

end

def parse_orders_input orders_input

	s1 =orders_input.split(",")

	arr = []

	s1.each do |x|
		s2 = x.split("=")

		s3 = s2[0].split("_")

		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]

		arr.push arr2
	end
	return arr
end