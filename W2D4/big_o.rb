class Array
    def bubble_sort(&prc)
        sort_this = self.dup
        prc ||= Proc.new {|left,right| left <=> right}
        sorted = false
        until sorted
            sorted = true
            sort_this[0...-1].each_with_index do |left, idx1|
                idx2 = idx1 + 1 
                right = sort_this[idx2]
                if prc.call(left,right) == 1
                    sort_this[idx1], sort_this[idx2] = sort_this[idx2], sort_this[idx1] 
                    sorted = false
                end
            end
        end
        sort_this
    end

    def merge_sort(&prc)
        sort_this = self.dup
        return self if self.length <= 1
        prc ||= Proc.new{|left,right| left <=> right}
        mid = sort_this.length / 2
        left = sort_this.take(mid)
        right = sort_this.drop(mid)

        left = left.merge_sort(&prc)
        right = right.merge_sort(&prc)

        merge(left,right,&prc)
    end

    def longest_string
        longest_string= ""
        self.each do |string|
            longest_string = string if string.length > longest_string.length
        end
        longest_string
    end

    private
    def merge(left, right, &prc)
        merged = []
        until left.empty? || right.empty?
            compare = prc.call(left,right)
            compare <= 0 ? merged << left.shift : merged << right.shift
        end
        merged + left + right
    end

   
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# n^2
p fish.bubble_sort{|left,right| left.length <=> right.length}.last

# nlog(n)
p fish.merge_sort{|left,right| left.length <=> right.length}.last

# n time
p fish.longest_string


def slow_dance(direction, tiles_array)
    tiles_array.index(direction)
end

def slow_dance(direction, tiles_hash)
    tiles_hash[direction]
end