require 'sinatra'
require './expense'

expenses = []
id_counter = 1

get '/' do
	@expenses = expenses
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

get 'show/:id' do
	@item = nil
	expenses.each do |i|
		if (i.id == params[:id])
			@item = i
		end
	end
	erb :show
end
