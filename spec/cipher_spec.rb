# frozen_string_literal: true

require './lib/cipher'

describe '#wrap26' do
  context 'returns a number' do
    it 'when num is less than 26 it returns num' do
      num = 15
      expect(wrap26(num)).to be num
    end
    it 'when num less than 26, it subtracts by 26 until num is less than 26' do
      num = 27
      expect(wrap26(num)).to be 1
    end
  end
end
