require 'sinatra'
require 'json'

get '/' do
  'Hello world!'
end

get '/hi' do
  'Sup'
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  "Hello #{params[:name]}!"
end


get '/hellon/:name' do |n|
  "Hello #{n}!"
end

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params[:splat] # => ["hello", "world"]
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  params[:splat] # => ["path/to/file", "xml"]
end

get '/posts.?:format?' do
  # matches "GET /posts" and any extension "GET /posts.json", "GET /posts.xml" etc.
  if params[:format] == 'json' then
    {:hello => 'there!'}.to_json
  else
    "<document>Hello there!</document>"
  end
end

