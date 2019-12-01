# This will be a program that will be able to encrypt and decrypt 'Mike Wazowski' encryptions.
# Encrypting a string will require a key to use to construct a matrix and rewrite as an
# encrypted string.

require_relative "wazowski_encryptor"

# Get Key and Input from command line
key = ARGV[0].upcase
input = File.read(ARGV[1]).gsub(/\s+/, "")

puts "Key: #{key}"
puts "Input: #{input}"

encryptor = WazowskiEncryptor.new(key, input)
puts encryptor.encrypted_string
