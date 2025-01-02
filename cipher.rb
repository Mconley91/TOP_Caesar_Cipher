
puts "Enter a word to be encrypted: " 
word = gets.chomp
puts "Now enter a number to shift your letters by: "
number = gets.chomp.to_i

def wrap_26(num)
  if num > 26
    loop do
      num -= 26
      if num - 26 < 0
        return num
      end
    end
  end
  return num
end

def caesar_cipher(str,num)
  alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  
  caesared_word = str.split("").map{|letter| letter == letter.upcase ? 
  alphabet[wrap_26(alphabet.index(letter.downcase) + num)].upcase : 
  alphabet[wrap_26(alphabet.index(letter.downcase) + num)]}.join("")

  puts "Output: #{caesared_word} Number: #{num}"
end

caesar_cipher(word,number)

