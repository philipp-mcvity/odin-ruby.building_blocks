#!/usr/bin/ruby
# frozen_string_literal: true

def caesar_cipher(string, rotation)
  case_ary = string.split('').map { |n| n != n.downcase }
  rotated = rotate(string.downcase.bytes, rotation % 26)
  rotated.map!.with_index { |n, i| case_ary[i] ? n.upcase : n }.join
end

def rotate(bytes_ary, rotation)
  rot_ary = []
  bytes_ary.each do |num|
    byte = ((97..122).include?(num) ? get_byte(num, rotation) : num)
    rot_ary << byte.chr
  end
  rot_ary
end

def get_byte(num, rotation)
  case (pos = num + rotation)
  when 97..122
    pos
  when 123..148
    pos - 26
  when 71..96
    pos + 26
  end
end

# puts 'Input:'
# string = gets.chomp
# while string.empty?
#   puts 'Input must not be empty:'
#   string = gets.chomp
# end
#
# puts 'Rotation:'
# rot_input = gets.chomp.to_i
# while rot_input.zero?
#   puts 'Rotation must be an Integer not equal to zero:'
#   rot_input = gets.chomp.to_i
# end
#
# print caesar_cipher(string, rot)
# puts
