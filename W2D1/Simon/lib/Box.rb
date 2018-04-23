require 'Curses'
#require 'colorize'
#require 'byebug'
class Box
    attr_accessor :x_size, :y_size, :x_pos, :y_pos, :win, :color, :symbol, :color_symbol
    def initialize(color_symbol, box_size, pos, color_indicies)
        symbol = "O"
        @x_size = box_size[0]
        @y_size = box_size[1]
        @x_pos  = pos[0]
        @y_pos  = pos[1]
        @win    = Curses::Window.new(@y_size, @x_size, @y_pos, @x_pos)

        @symbol = symbol
        @color_symbol = color_symbol
        @color_indicies = color_indicies
        @win.color_set(color_indicies[0])
        fill

        #@line_symbol = symbol * (x_size - 1)

    end

    def refresh
        @win.refresh
    end

    def click_check(x,y)
        if x <= (x_pos + x_size) && x >= x_pos
            if y <= (y_pos + y_size) && y >= y_pos
                return @color_symbol
            end
        end
        return nil
    end

    def show_color
        display_correct
    end

    def clear_box
        @win.clear
    end

    # def fill_check
    #     fill
    #     @win.refresh
    # end

    ###### NEED ONE WITHOUT SLEEPS FOR SYNCRONICITY
    def display_success
        bolden
        @win.refresh
    end

    def display_default
        normal_display
        @win.refresh
    end
    ######@###########

    def hide
        hide_display
        @win.refresh
    end

    def display_correct
        bolden
        sleep 0.3
        normal_display
        sleep 0.1
    end

    def display_wrong
        exclaim
        sleep 0.3
        normal_display
        sleep 0.1
    end

    private



    # def click
    #             #send game input
    #     if true #game.correct_selection?
    #         display_correct
    #     else
    #         display_wrong
    #     end
    # end


    def normal_display
        @win.color_set(@color_indicies[0])
        fill
    end

    def bolden
        @win.color_set(@color_indicies[1])
        fill
    end

    def exclaim
        @win.color_set(9)
        fill
    end

    def hide_display
        @win.color_set(10)
        fill
    end

    def fill
        #perhaps I can create each
        # line in initialization and add them
        #NOPE it didn't speed anything up
        (1...@x_size).each do |x|
            (1...@y_size).each do |y|
                @win.setpos(y,x)
                #@win.addstr(@line_symbol)
                @win.addch(@symbol)
                #@win.refresh
            end
        end

        @win.refresh

    end




    # def flash
    #     fill( , )
    # end


end
