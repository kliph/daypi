require 'sinatra'
require 'week_of_month'
require_relative './plugins/default'

# Weeks start on Monday
WeekOfMonth.configuration.monday_active = true

FORMATS = {
  default: ->(date) { Plugins::Default.date_to_daypi(date) }
}

get '/' do
  redirect '/today'
end

get '/today' do
  fn = FORMATS[params[:format].to_sym] || FORMATS[:default]
  erb :index, locals: fn.call(Date.today)
end

get '/month/:month/day/:day' do
  fn = FORMATS[params[:format].to_sym] || FORMATS[:default]
  erb :index, locals: fn.call(Date.new(Date.today.year, params['month'].to_i, params['day'].to_i))
end

get '/year/:year/month/:month/day/:day' do
  fn = FORMATS[params[:format].to_sym] || FORMATS[:default]
  erb :index, locals: fn.call(Date.new(params['year'].to_i, params['month'].to_i, params['day'].to_i))
end
