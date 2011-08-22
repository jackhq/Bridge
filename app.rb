require 'sinatra'
require 'json'

set :public => File.dirname(__FILE__)

before do
  content_type "application/json"
end

get '/foo' do
  { :hello => "world" }.to_json
end

get '/txfailure' do
  { :errors => "server error" }.to_json
end

get '/foo/:id' do |id|
  { :hello => "world" }.to_json
end

get '/txfailure/:id' do |id|
  { :errors => "server error" }.to_json
end

post '/foo' do
  { :hello => "world" }.to_json
end

post '/txfailure' do 
  { :errors => "server error" }.to_json
end

put '/foo/:id' do |id|
  { :hello => "world" }.to_json
end

put '/txfailure/:id' do |id|
  { :errors => "server error" }.to_json
end

delete '/foo/:id' do |id|
  { :hello => "world" }.to_json
end

delete '/txfailure/:id' do |id|
  { :errors => "server error" }.to_json
end


