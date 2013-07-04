helpers do
	def setup
		account_sid = 'AC185aaef0695d4a5fd5dc34bf6cb3cde2'
		auth_token = '8e1420f23e6c7487b912bac1aec70583'

		@client = Twilio::REST::Client.new account_sid, auth_token

		@from = "+13345170627" # My Twilio number

		@friends = {
		"+13343994374" => params[:post][:recipient],
		}
	end

	def send_message(params)
		@friends.each do |key, value|
		  @client.account.sms.messages.create(
		    :from => @from,
		    :to => key,
		    :body => "#{value}, #{params[:message]} <3 #{params[:sender]}"
		  )
		  puts "Sent message to #{value}"
		end
	end
end