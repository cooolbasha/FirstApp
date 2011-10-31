require "rubygems"
require "sinatra"
require "sinatra/reloader"

set :name => 'manickam', :environment => :development
set :greet_name, Proc.new{"hello "+name}
enable :session
enable :logging
set :port , 80



get '/' do
  p "Hello world #{Time.now} at the server"
end



get '/foo' do
  "Sir My name is " + settings.greet_name
end

get '/register/:name' do
  "Welcome to the registeration Page #{params[:name]}!"
end

get '/say/*/to/*' do
   params[:splat]
end

get '/download/*.*' do |path, ext|
    [path, ext] # => ["path/to/file", "xml"]
  end

get '/bye' do
  erb :bye    
end
