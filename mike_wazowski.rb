# This will be a program that will be able to encrypt and decrypt 'Mike Wazowski' encryptions.
# Encrypting a string will require a key to use to construct a matrix and rewrite as an
# encrypted string.

require_relative "wazowski_encryptor"
require_relative "wazowski_decryptor"

# Get Key and Input from command line
key = ARGV[0].upcase
encrypt_input = File.read(ARGV[1])

puts "Key: #{key}"
puts "Encrypt Input: #{encrypt_input}"

encryptor = WazowskiEncryptor.new(key, encrypt_input)
puts encryptor.encrypted_string

decryptor = WazowskiDecryptor.new(key, encryptor.encrypted_string)
puts decryptor.decrypted_string
