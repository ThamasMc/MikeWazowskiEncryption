# Class that takes in a key and input and can return an encrypted string
# TODO Add error handling

class WazowskiEncryptor
  def initialize(key, input)
    @key = key.upcase
    @input = input.downcase.gsub(/\s+/, "")

    @input_arr = initialize_input_matrix
    @encrypted_string = encrypt_input
  end

  def encrypted_string
    @encrypted_string
  end

  private
  def initialize_input_matrix
    # Initialize input matrix
    input_rows = @input.size / @key.size
    input_rows += 1 if @input.size % @key.size > 0
    
    input_arr = Array.new(input_rows) { Array.new(@key.size) }
    
    # Fill input matrix
    count = 0
    input_arr.each do |row|
      row.size.times do |i|
        row[i] = @input[count] #TODO Fix this to keep nil in mind
        count += 1
      end
    end

    input_arr
  end

  def encrypt_input
    # Map key characters
    key_map = {}
    
    key_chars = @key.chars.sort.uniq
    
    key_chars.each_with_index do |k, i|
      key_map[k] = i
    end
    
    # Initialize Array to store answers
    answer_array = Array.new(key_map.count) { Array.new() }
    
    # Iterate through input matrix and push to appropriate index in answer array
    @input_arr.size.times do |i|
      @input_arr[i].size.times do |j|
        answer_array[key_map[@key[j]]].push(@input_arr[i][j]) if @input_arr[i][j]
      end
    end
    
    encrypted_string = ""
    
    count = 0
    answer_array.each do |row|
      row.each do |c|
        encrypted_string << " " if count % 5 == 0 && count > 0
        encrypted_string << c
        count += 1
      end
    end
    
    encrypted_string
  end
end
