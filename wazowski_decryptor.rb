# Class that takes in a key and input and can return a decrypted string

class WazowskiDecryptor
  def initialize(key, input)
    @key = key.upcase
    @input = input.downcase.gsub(/\s+/, "")

    @output_arr = initialize_output_matrix
    @decrypted_string = decrypt_input
  end

  def decrypted_string
    @decrypted_string
  end

  private
  def initialize_output_matrix
    output_rows = @input.size / @key.size

#   Counting the number of characters for each letter in the key
    key_count_map = {}
    key_chars = @key.chars.sort.uniq
    key_chars.each do |c|
      key_count_map[c] = @key.chars.count(c) * output_rows
    end

    row_remainder = @input.size % @key.size
    if row_remainder > 0
      output_rows += 1
      @key.chars.first(row_remainder).each do |c|
        key_count_map[c] += 1
      end
    end

    key_map = {}
    key_chars.each_with_index do |c, i|
      key_map[c] = i
    end

#   Populate answer array
    answer_arr = Array.new(key_map.count) { Array.new() }
    char_str = @input.chars
    key_chars.each do |c|
      answer_arr[key_map[c]] = char_str.shift(key_count_map[c])
    end

    #Populate output matrix
    output_arr = Array.new(output_rows) { Array.new(@key.size) }

    output_arr.size.times do |i|
      output_arr[i].size.times do |j|
        output_arr[i][j] = answer_arr[key_map[@key[j]]].shift
      end
    end

    output_arr
  end


  def decrypt_input
    decrypted_string = ""

    count = 0
    @output_arr.each do |row|
      row.each do |c|
        break unless c
        decrypted_string << " " if count % 5 == 0 && count > 0
        decrypted_string << c
        count += 1
      end
    end

    decrypted_string
  end
end
