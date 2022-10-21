#Exercise 1 - Stack

class Stack
    #LIFO method
    attr_reader :array
    def initialize
      # create ivar to store stack here!
        @array = []

    end

    def push(el)
      # adds an element to the stack
      array.push(el)
    end

    def pop
      # removes one element from the stack
      array.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      array[-1]
    end
  end

  #Exercise 2 - Queue

  class Queue
    #FIFO method

    attr_reader :array
    def initialize
        @array = []
    end

    def enqueue(el)
        array.push(el)
    end

    def dequeue
        array.shift
    end

    def peek
        array[0]
    end
  end

  #Exercise 3 - Map

  class Map

    attr_reader :array

    def initialize
        @array = []
    end

    def set(key,value)
        subarr_idx = array.index{|subarr| subarr[0] == key}
        if subarr_idx
            array[subarr_idx][1] = value
        else
            array.push([key,value])
        end
        value
    end

    def get(key) #include
        array.each {|subarr| subarr[1] if subarr[0] == key }
    end

    def delete(key)
        val = get(key)
        array.reject! {|subarr| subarr[0] == key}
        value

    end

    def show
        result = []
        
        array.each { |el| el.instance_of?(Array) ? result << el.deep_dup : result << el }
        
        result
    end
  end