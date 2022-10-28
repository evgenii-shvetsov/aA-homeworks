#Big O-ctopus and Biggest Fish

            #sluggish Octupus
#Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_o(arr)
    biggest_length = arr[0].length
    longest_word = arr[0]
    arr.each do |word|
        if word.length > biggest_length
            biggest_length = word.length
            longest_word = word
        end
    end
    longest_word
end
# p sluggish_o(arr)

            # Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the sorting complexity demo from the Sorting Complexity reading. Remember that Big O is classified by the dominant term.
require "byebug"
#bubble sort
def bubble_sort(arr)
    sorted = false
    while !sorted
        sorted = true
        (0...arr.length-1).each do |i|
            # debugger
            if arr[i].length > arr[i+1].length
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted = false
            end
        end
    end
    arr[-1]
end
# p bubble_sort(arr)


                        # Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.