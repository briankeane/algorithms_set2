require "pry-debugger"


module Set2
  def self.find_intersection(array1, array2 = [], array3 = [])

    # return empty array if any arrays are empty
    if array1.length == 0 || array2.length == 0 || array3.length == 0
      return []
    end

    matching = []

    # put em all in alphabetical order
    array1.sort!
    array2.sort!
    array3.sort!

    array1_index = 0
    array2_index = 0
    array3_index = 0


    #binding.pry

    for array1_index in 0...array1.length do

      #seek the spot in array2 where they should match


      while (array2_index < array2.length) && (array1[array1_index] >= array2[array2_index]) do
        array2_index += 1
      end

      #put counter back for comparison
      if array2_index != 0 then array2_index -= 1 end

      #now if they do match, search the 3rd array
      if array1[array1_index] == array2[array2_index]
        #seek the spot in array3 where they should match
        while((array3_index < array3.length) && (array1[array1_index] >= array3[array3_index])) do
          array3_index += 1
        end

        #put counter back for comparison
        if array3_index != 0 then array3_index -= 1 end

        #if they're all 3 equal, push the value to matching
        if array1[array1_index] == array3[array3_index]
          matching << array1[array1_index]
        end

      end  #end if 2nd matches

    end  #end for

    return matching
  end

  def self.find_intersection2(array1, array2=[], array3=[])   #solution 2 (with Hash)
    instance_counts = Hash.new(0)
    array1.each { |x| instance_counts[x] += 1 }
    array2.each { |x| instance_counts[x] += 1 }
    array3.each { |x| instance_counts[x] += 1 }
    return instance_counts.select { |k,v| v >= 3 }.keys
  end

  def self.find_first_dup(array)
    duplicates = Hash.new(0)
    array.each do |x|
      duplicates[x] += 1
      if duplicates[x] > 1
        return x
      end
    end
    return nil
  end

  def self.find_mode(array)
    if array.length < 1 then return nil end
    instance_counts = Hash.new(0)
    array.each { |x| instance_counts[x] += 1 }
    return instance_counts.max_by { |k,v| v }[0]
  end

end
