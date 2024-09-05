# Class to generate Fibonacci sequence up to nth term
class Fibonacci
  def self.sequence(n)
    return [] if n < 1
    return [0] if n == 1
    return [0, 1] if n == 2

    seq = [0, 1]
    while seq.length < n
      seq << seq[-1] + seq[-2]
    end
    seq
  end
end

# Function to get integer input
def get_integer_input(prompt)
  puts prompt
  input = gets.chomp
  Integer(input) rescue nil
end

# User input and validation for Fibonacci sequence
n = nil
until n.is_a?(Integer) && n >= 0
  n = get_integer_input("Enter a non-negative integer for the length of the Fibonacci sequence:")
  puts "Invalid input. Please enter a valid non-negative integer." unless n.is_a?(Integer) && n >= 0
end

puts "Fibonacci sequence up to #{n} terms:"
puts Fibonacci.sequence(n).join(', ')

# Class to find missing numbers in an array
class MissingNumbers
  def self.find_missing(nums)
    nums = nums.sort.uniq
    return [] if nums.empty?
    (nums.first..nums.last).to_a - nums
  end

  def self.validate_input(nums)
    raise ArgumentError, "Input must be an array of integers." unless nums.is_a?(Array) && nums.all? { |num| num.is_a?(Integer) }
  end
end

# User input and validation for missing numbers
puts "Enter a series of integers separated by spaces (e.g., 1 2 4 5):"
input_nums = gets.chomp
nums = input_nums.split.map { |num| Integer(num) rescue nil }.compact

begin
  MissingNumbers.validate_input(nums)
  if nums.empty?
    puts "No valid integers entered. Please try again."
  else
    missing = MissingNumbers.find_missing(nums)
    puts "Missing numbers: #{missing.join(', ')}"
  end
rescue ArgumentError => e
  puts e.message
end
