#!/usr/bin/ruby
# frozen_string_literal: true

def stock_picker(stock_prices)
  future_returns = {}
  (0...stock_prices.length - 1).each do |day|
    daily_array = []
    (day + 1...stock_prices.length).each do |i|
      daily_array << stock_prices[i] - stock_prices[day]
    end
    future_returns[day] =
      [daily_array.max, daily_array.index(daily_array.max) + day + 1]
  end
  best_pick = future_returns.max_by { |_k, v| v[0] }
  print "#{best_pick_arr = best_pick[0], best_pick[1][1]}\n"
#   print "#{best_pick_arr}\n=>
# Buy on day #{best_pick[0]} for $#{stock_prices[best_pick[0]]} and
# sell on day #{best_pick[1][1]} for $#{stock_prices[best_pick[1][1]]}
# to achieve the maximum profit of $#{best_pick[1][0]}.\n"
end

puts "Enter
1: evaluate the default 'Odin-Stock' = [17, 3, 6, 9, 15, 8, 6, 1, 10]
2: generate and evalute a '9 days-rand(21) stock'"

input = gets.chomp.to_i

until (1..2).include?(input)
  puts 'enter 1 or 2'
  input = gets.chomp.to_i
end

case input
when 1
  stock_odin = [17, 3, 6, 9, 15, 8, 6, 1, 10]
  puts
  stock_picker(stock_odin)
else
  stock_rand = []
  9.times { stock_rand << rand(21) }
  puts "> random stock values: #{stock_rand}\n\n"
  stock_picker(stock_rand)
end
