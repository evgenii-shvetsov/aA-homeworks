require "byebug"

# Exercise 1 - sum_to

# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

def sum_to(n)  #DONE
    return nil if n <= 0
    return 1 if n == 1
    
    n + sum_to(n-1)
end

  # Test Cases
# p sum_to(5)  # => returns 15
# p  sum_to(1)  # => returns 1
# p   sum_to(9)  # => returns 45
# p   sum_to(-8)  # => returns nil

# Exercise 2 - add_numbers

# Write a function add_numbers(nums_array) that takes in an array of Integers and returns the sum of those numbers. Write this method recursively.

def add_numbers(arr) #DONE
    return nil if arr.empty?
    return arr[0] if arr.length <= 1
    # debugger
    arr[0] + add_numbers(arr[1..-1])
end

  # Test Cases
# p  add_numbers([1,2,3,4]) # => returns 10
# p  add_numbers([3]) # => returns 3
# p  add_numbers([-80,34,7]) # => returns -39
# p  add_numbers([]) # => returns nil


# Exercise 3 - Gamma Function

# Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.


#   # Test Cases
#   gamma_fnc(0)  # => returns nil
#   gamma_fnc(1)  # => returns 1
#   gamma_fnc(4)  # => returns 6
#   gamma_fnc(8)  # => returns 5040


# Exercise 5 - Reverse

# Write a function reverse(string) that takes in a string and returns it reversed.

def reverse(str)
    return str if str.length <= 1

    str[-1] + reverse(str[0..-2])
end

# Test Cases
# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""

