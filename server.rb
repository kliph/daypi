require 'sinatra'
require 'week_of_month'

# Weeks start on Monday
WeekOfMonth.configuration.monday_active = true

DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

def month_to_daypi(ordinal_month)
  idx = ordinal_month - 1
  ordinal_month > 7 ? "#{DAYS[1]}#{DAYS[idx % 7]}" : "#{DAYS[0]}#{DAYS[idx % 7]}"
end

def week_of_month_to_daypi(ordinal_week_of_month)
  DAYS[ordinal_week_of_month]
end

def date_to_daypi(date)
  month_part = month_to_daypi(date.month)
  week_part = week_of_month_to_daypi(date.week_of_month - 1)
  day_part = date.strftime('%A')
  { month_part: month_part, week_part: week_part, day_part: day_part }
end

get '/' do
  redirect '/today'
end

get '/today' do
  erb :index, locals: date_to_daypi(Date.today)
end

get '/month/:month/day/:day' do
  erb :index, locals: date_to_daypi(Date.new(Date.today.year, params['month'].to_i, params['day'].to_i))
end
