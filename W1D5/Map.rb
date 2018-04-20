
class Map
    #assign a symbol to an index of an array
    def initialize
        @array = []
    end

    def assign(key, value)
        @array << [key,value]
    end

    def lookup(key)
        @array.each do |duple|
            return duple[1] if duple[0] == key
        end
    end

    def remove(key)
        delete_here = nil
        @array.each_with_index do |duple, idx|
            if duple[0] == key
                delete_here = idx
                break
            end
        end
        if delete_here == nil
            return nil
        end
        @array.delete_at(delete_here)
        return @array
    end
end
