  class LRUCache
    def initialize(size)
        @size = size
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.include?(el)
        @cache.delete(el)
        @cache.push(el)
        show
      elsif count >= @size
        @cache.shift
        @cache.push(el)
        show
      else
        @cache.push(el)
        show
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache
      nil
    end

    private
    # helper methods go here!

  end