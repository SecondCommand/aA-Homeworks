class Queue
    def initialize
        @array_queue = Array.new()
    end

    def enque(el)
        @array_queue.push(el)
      # adds an element to the stack
    end

    def dequeue
        @array_queue.shift
      # removes one element from the stack
    end

    def show
        @array_queue# return a copy of the stack
    end
end
