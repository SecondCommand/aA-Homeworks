class Stack
    def initialize
        array_stack = Array.new()
    end

    def add(el)
        array_stack.push(el)
      # adds an element to the stack
    end

    def remove
        array_stack.pop
      # removes one element from the stack
    end

    def show
      array_stack# return a copy of the stack
    end
  end
