# spec/caesar_cipher_spec.rb
# frozen_string_literal: true

require './lib/caesar_cipher.rb'

describe '#caesar_cipher' do
  it 'returns a single word' do
    expect(caesar_cipher('what', 5)).to eql('bmfy')
  end

  it 'returns a single capitalized word' do
    expect(caesar_cipher('What', 5)).to eql('Bmfy')
  end

  it 'returns multiple words' do
    expect(caesar_cipher('what a string', 5)).to eql('bmfy f xywnsl')
  end

  it 'returns multiple words with capitalization and punctuation mark' do
    expect(caesar_cipher('What a String!', 5)).to eql('Bmfy f Xywnsl!')
  end

  it 'works with larger positive rotation' do
    expect(caesar_cipher('What a string!', 255)).to eql('Rcvo v nomdib!')
  end

  it 'works with larger negative rotation' do
    expect(caesar_cipher('What a string!', -77)).to eql('Xibu b tusjoh!')
  end
end
