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

describe '#check_str' do
  context 'checks all characters in input and returns a boolean' do
    it 'returns false if input contains numbers' do
      alphabet = %w[a b c d e f g h i j k l m n o p q r s t u
                    v w x y z]
      input = 'warhammer40k'
      expect(check_str(input, alphabet)).to be false
    end
    it 'returns true when only letters are used' do
      alphabet = %w[a b c d e f g h i j k l m n o p q r s t u
                    v w x y z]
      input = 'warhammer'
      expect(check_str(input, alphabet)).to be true
    end
    it 'returns true when spaces and exclamation points are used' do
      alphabet = %w[a b c d e f g h i j k l m n o p q r s t u
                    v w x y z]
      input = '                 !!!!'
      expect(check_str(input, alphabet)).to be true
    end
  end
end

describe '#check_num' do
  context 'checks that num is not zero' do
    it 'returns true if num is not zero' do
      num = 1
      expect(check_num(num)).to be true
    end
    it 'returns false if num is zero' do
      num = 0
      expect(check_num(num)).to be false
    end
  end
end
