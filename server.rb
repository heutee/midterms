require 'sinatra'
require './expense'

expenses = []
id_counter = 1

def total(array)
	result = 0.0
	array.each do |i| 
		result += i.amount
	end
	return result
end

get '/' do
	@expenses = expenses
	@total_amount = total(expenses)
	erb :index
end

get '/new' do
	erb :new
end

post '/save' do
	expense = Expense.new(id_counter, params[:item].to_s, params[:amount].to_f)
	expenses << expense
	id_counter += 1
	redirect to '/'
end

get '/show/:id' do
	expenses.each do |i|
		if (i.id == params[:id])
			@item = i
		end
	end
	erb :show
end
