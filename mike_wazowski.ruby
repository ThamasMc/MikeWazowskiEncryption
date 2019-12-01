# This will be a program that will be able to encrypt and decrypt 'Mike Wazowski' encryptions.
# Encrypting a string will require a key to use to construct a matrix and rewrite as an
# encrypted string.

# Get Key and Input from command line
key = ARGV[0].upcase
input = File.read(ARGV[1]).gsub(/\s+/, "")

puts "Key: #{key}"
puts "Input: #{input}"

# Initialize input matrix
input_rows = input.size / key.size
input_rows += 1 if input.size % key.size > 0

input_arr = Array.new(input_rows) { Array.new(key.size, 0) }

# Fill input matrix
count = 0
input_arr.each do |row|
  row.size.times do |i|
    row[i] = input[count]
    count += 1
  end
end

# Map key characters
key_map = {}

key_chars = key.chars.sort.uniq

key_chars.each_with_index do |k, i|
  key_map[k] = i
end

# Initialize Array to store answers
answer_array = Array.new(key_map.count) { Array.new() }

# Iterate through input matrix and push to appropriate index in answer array
input_arr.size.times do |i|
  input_arr[i].size.times do |j|
    answer_array[key_map[key[j]]].push(input_arr[i][j]) if input_arr[i][j]
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

puts encrypted_string
