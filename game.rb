require 'sinatra'

before do
  content_type :txt
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end



get '/throw/:type' do
  #play here
  player_throw= params[:type].to_sym
#Handle cases where player makes a throw that is forbidden
  if !@throws.include?(player_throw)
  halt 403, "Dumbass, you gotta shoot: #{@throws}"
  end

  #computer_throw

  computer_throw = @throws.sample


  #compare cpu throw with your throw

  if player_throw == computer_throw
    "Tie mothafucka"
  elsif computer_throw == @defeat[player_throw]
    "Good shit bro; #{player_throw} beats #{computer_throw}"
  else
    "Jackaaaas!#{computer_throw} beats #{player_throw}"
  end

end