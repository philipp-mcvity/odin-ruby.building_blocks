#!/usr/bin/ruby
# frozen_string_literal: true

def caesar_cipher(string, shift)
  array_dec = string.bytes
  array_dec_rot = []
  array_dec.map! do |dec|
    pos = dec + shift
    if (97..122).include? dec
      dec = case pos
            when 97..122
              pos
            when 123..148
              pos - 26
            when 71..96
              pos + 26
            end
    end
    if (65..90).include? dec
      dec = case pos
            when 65..90
              pos
            when 91..117
              pos - 26
            when 39..64
              pos + 26
            end
    end
    array_dec_rot << dec
  end
  array_dec_rot.map!(&:chr).join
end

puts 'Input:'
string = gets.chomp
while string.empty?
  puts 'Input must not be empty:'
  string = gets.chomp
end

puts 'Shift:'
shift_input = gets.chomp.to_i
while shift_input.zero?
  puts 'Shift must be an Integer not equal to zero:'
  shift_input = gets.chomp.to_i
end
shift = shift_input % 26

print caesar_cipher(string, shift)
puts
