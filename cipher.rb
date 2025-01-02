
puts "Enter a word to be encrypted: " 
word = gets.chomp
puts "Now enter a number to shift your letters by: "
number = gets.chomp.to_i

def wrap_26(num) #allows numbers exceeding 26 to 'wrap'
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

def check_str(str,alphabet)
  str.split("").all?{|letter| alphabet.include?(letter.downcase) || letter == " " || letter == "!"} ? true : false
end

def check_num(num)
  num != 0
end

def caesar_cipher(str,num)
  alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  if (!check_str(str,alphabet) || !check_num(num))
    puts "Invalid Entry"
    return
  end
  caesared_word = str.split("").map{|letter| letter == " " || letter == "!" ? letter : 
  letter == letter.upcase ? 
  alphabet[wrap_26(alphabet.index(letter.downcase) + num)].upcase : 
  alphabet[wrap_26(alphabet.index(letter.downcase) + num)]}.join("")
  puts "Output: #{caesared_word}"
end

caesar_cipher(word,number)
