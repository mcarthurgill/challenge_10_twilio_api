get '/' do
	erb :index
end

post '/messages' do
	# put your own credentials here
	account_sid = 'AC185aaef0695d4a5fd5dc34bf6cb3cde2'
	auth_token = '8e1420f23e6c7487b912bac1aec70583'

	# set up a client to talk to the Twilio REST API
	@client = Twilio::REST::Client.new account_sid, auth_token

	from = "+13345170627" # Your Twilio number

	friends = {
	"+13343994374" => params[:post][:recipient],
	}

	friends.each do |key, value|
	  @client.account.sms.messages.create(
	    :from => from,
	    :to => key,
	    :body => "sup #{value}...#{params[:post][:message]} <3 #{params[:post][:sender]}"
	  )
	  puts "Sent message to #{value}"
	end
	erb :thank_you
end