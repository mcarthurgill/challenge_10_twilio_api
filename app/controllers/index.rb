get '/' do
	erb :index
end

post '/messages' do
	setup
	send_message(params[:post])
	erb :thank_you
end

get '/voice' do
	setup
  make_call
  erb :thank_you
end

get '/call_log' do
	setup
	get_call_log
	erb :thank_you
end