get '/' do
	erb :index
end

post '/messages' do
	setup
	send_message(params[:post])
	erb :thank_you
end