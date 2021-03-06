require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  counter = 0

  until array[counter] == nil
    counter += 1
  end

  return counter
end

# Prints each integer values in the array
def print_array(array)
  counter = 0

  until array[counter] == nil
    puts array[counter]
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
if length > 0
  length.times do |index|
    if array[index] == value_to_find
      return true
    end
  end
end

  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  if length > 0
    largest_temp = array[0]

    length.times do |index|
      if array[index] > largest_temp
        largest_temp = array[index]
      end
    end

    return largest_temp
  end
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  if length > 0
    smallest_temp = array[0]

    length.times do |index|
      if array[index] < smallest_temp
        smallest_temp = array[index]
      end
    end

    return smallest_temp
  end
end

# Reverses the values in the integer array in place
def reverse(array, length)

  if length > 0
    high_index = length - 1
    low_index = 0

    while high_index > low_index
      temp_val = array[low_index]
      array[low_index] = array[high_index]
      array[high_index] = temp_val

      high_index -= 1
      low_index += 1
    end

    return array
  end
end


# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  sorted_array = array

  upper_bound = length - 1
  lower_bound = 0
  mid = ( (upper_bound + lower_bound) / 2 )

  while upper_bound >= lower_bound

    if sorted_array[mid] == value_to_find
      return true

    elsif sorted_array[mid] > value_to_find
      upper_bound = mid - 1

    elsif sorted_array[mid] < value_to_find
      lower_bound = mid + 1
    end

    mid = ( (upper_bound + lower_bound) / 2 )
  end

  return false
end
# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
