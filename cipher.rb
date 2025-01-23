# frozen_string_literal: true

puts 'Enter a word to be encrypted: '
word = gets.chomp
puts 'Now enter a number to shift your letters by: '
number = gets.chomp.to_i
# allows numbers exceeding 26 to 'wrap'
def wrap26(num)
  if num > 26
    loop do
      num -= 26
      return num if (num - 26).negative?
    end
  end
  num
end

def check_str(str, alphabet)
  str.chars.all? { |letter| alphabet.include?(letter.downcase) || letter == ' ' || letter == '!' } ? true : false
end

def check_num(num)
  num != 0
end

# rubocop: disable Metrics/AbcSize
# rubocop: disable Metrics/MethodLength
def caesar_cipher(str, num)
  alphabet = %w[a b c d e f g h i j k l m n o p q r s t u
                v w x y z]
  if !check_str(str, alphabet) || !check_num(num)
    puts 'Invalid Entry'
    return
  end
  caesared_word = str.chars.map do |letter|
    # rubocop: disable Performance/CollectionLiteralInLoop
    if [' ', '!'].include?(letter)
      letter
      # rubocop: enable Performance/CollectionLiteralInLoop
    elsif letter == letter.upcase
      alphabet[wrap26(alphabet.index(letter.downcase) + num)].upcase
    else
      alphabet[wrap26(alphabet.index(letter.downcase) + num)]
    end
  end.join
  puts "Output: #{caesared_word}"
end
# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/AbcSize

caesar_cipher(word, number)
