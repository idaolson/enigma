ARGV == ["message.txt", "encrypted.txt"]
ARGV[0] == "message.txt"
ARGV[1] == "encrypted.txt"

handle = File.open(ARGV[0], "r")
