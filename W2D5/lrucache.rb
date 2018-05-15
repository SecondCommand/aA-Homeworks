class LRUCache


  end

    def initialize(number)
        @storage = []
        number.times do
            storage << Array.new(1)
        end
    end


    def count
        storage.count{|el| el != nil}
      # returns number of elements currently in cache
    end

    def add(el)
        unless storage.include?(el)
            storage.shift
            storage.push el
        end
      # adds element to cache according to LRU principle
      # this means that it gets rid of the element that was least recently used

    end

    def show
      p storage # shows the items in the cache, with the LRU item first
    end

    private
    attr_reader :storage
    # helper methods go here!

end


johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
