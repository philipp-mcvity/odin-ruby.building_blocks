#!/usr/bin/ruby
# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(string, dictionary)
  str_ary = string.downcase.gsub(/[^a-z0-9 ']/, '').split
  substring_count = Hash.new(0)
  str_ary.each do |substr|
    dictionary.each do |word|
      substring_count[word] += 1 if substr.match(word)
    end
  end
  puts substring_count
end

substrings('below', dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
