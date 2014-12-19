require 'sinatra'
require 'sinatra/reloader'
#active record allows us to run migrations. ya heard
require 'sinatra/activerecord'
#authentication gem.
require 'sinatra/simple-authentication'
#rack flash is how we use flash message
require 'rack-flash'
#we need some models, plus the envirnoment files to connect to database
require './models/user'
require './config/environments'

#setting the configuration options on the authentication gem
Sinatra::SimpleAuthentication.configure do |c|
  c.use_password_confirmation = true
end


# Telling the app to use Rack::Flash
use Rack::Flash, :sweep => true

# Telling the app to use SimpleAuthentication
register Sinatra::SimpleAuthentication



#first route

get '/' do
  # Require a login to enter this route, otherwise go to the login page
  login_required
  erb :index
end
