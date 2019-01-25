module Plugins
  module Default
    extend self

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
  end
end
