#!/usr/bin/ruby
# frozen_string_literal: true

def caesar_cipher(string, rot)
  case_ary = string.split('').map { |n| n != n.downcase }
  bytes_ary = string.downcase.bytes
  rot_ary = []
  bytes_ary.each do |n|
    if (97..122).include?(n)
      pos = n + rot
      byte = case pos
             when 97..122
               pos
             when 123..148
               pos - 26
             when 71..96
               pos + 26
             end
    else
      byte = n
    end
    rot_ary << byte.chr
  end
  rot_ary.map!.with_index { |n, i| case_ary[i] ? n.upcase : n }
  rot_ary.join
end

puts 'Input:'
string = gets.chomp
while string.empty?
  puts 'Input must not be empty:'
  string = gets.chomp
end

puts 'Rotation:'
rot_input = gets.chomp.to_i
while rot_input.zero?
  puts 'Rotation must be an Integer not equal to zero:'
  rot_input = gets.chomp.to_i
end
rot = rot_input % 26

print caesar_cipher(string, rot)
puts
