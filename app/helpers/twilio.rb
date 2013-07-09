helpers do
	def setup
		account_sid = 'AC185aaef0695d4a5fd5dc34bf6cb3cde2'
		auth_token = '8e1420f23e6c7487b912bac1aec70583'

		@client = Twilio::REST::Client.new account_sid, auth_token

		@from = "+13345170627" # My Twilio number
	end

	def send_message(params)
		friends = {
		"+13343994374" => params[:recipient],
		}

		friends.each do |key, value|
		  @client.account.sms.messages.create(
		    :from => @from,
		    :to => key,
		    :body => "#{value}, #{params[:message]} <3 #{params[:sender]}"
		  )
		  puts "Sent message to #{value}"
		end
	end

	def make_call
		@call = @client.account.calls.create(
		  :from => "+13345170627",   # From your Twilio number
		  :to => '+13343994374',     # To any number
		  # Fetch instructions from this URL when the call connects
		  :url => 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
		)
	end

	def get_call_log
		@calls = @client.account.calls.list
	end
end