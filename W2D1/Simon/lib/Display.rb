#set up a window in the correct spot
#set up all windows desired
#figure out mouse command
require_relative 'box'
require 'Curses'
#require 'colorize'
#require 'byebug'
class Display
    def initialize(colors)
        Curses.init_screen
        Curses.curs_set(0) #invisible cursor yay
        Curses.start_color
        Curses.crmode #not sure
        Curses.noecho
        Curses.stdscr.keypad(true) #deactivates... scrolling?
        Curses.mousemask(Curses::BUTTON1_CLICKED)
        Curses.refresh #HIGHLY NECESSARY
        #prevents getch from making stdcr overwrite everything

        #++++++++++++++++
        @box_size = [Curses.cols / 2 - 1, Curses.lines / 2]
                                #X,Y
        box_top_left_pos      = [0,0]
        box_top_right_pos     = [(Curses.cols/2), 0]

        box_bottom_right_pos  = [Curses.cols / 2, Curses.lines / 2]
        box_bottom_left_pos   = [0, Curses.lines / 2]
        #+++++++++++++++++
        #THIS STUFF DEFINES THE SPECIFIC BOXES

        Curses.init_pair(1, create_color(colors[0]), Curses::COLOR_BLACK)
        Curses.init_pair(2, create_color(colors[0]), Curses::COLOR_WHITE)

        Curses.init_pair(3, create_color(colors[1]), Curses::COLOR_BLACK)
        Curses.init_pair(4, create_color(colors[1]), Curses::COLOR_WHITE)

        Curses.init_pair(5, create_color(colors[2]), Curses::COLOR_BLACK)
        Curses.init_pair(6, create_color(colors[2]), Curses::COLOR_WHITE)          #  ||
                                                                                   #  ||
        Curses.init_pair(7, create_color(colors[3]), Curses::COLOR_BLACK)          #  ||
        Curses.init_pair(8, create_color(colors[3]), Curses::COLOR_WHITE)          #  ||
                                                                                   # \  /
        #INCORRECT DISPLAY BUZZ                                                       V
        Curses.init_pair(9, Curses::COLOR_BLACK, Curses::COLOR_RED)

        #HIDE BOXES
        Curses.init_pair(10, Curses::COLOR_BLACK, Curses::COLOR_BLACK)

        #top left window
        #debugger
        box_top_left     = Box.new(colors[0], @box_size, box_top_left_pos, [1,2])
        box_top_right    = Box.new(colors[1], @box_size, box_top_right_pos, [3,4])
        box_bottom_left  = Box.new(colors[2], @box_size, box_bottom_left_pos, [5,6])
        box_bottom_right = Box.new(colors[3], @box_size, box_bottom_right_pos, [7,8])

        @input_boxes = [
            box_top_left,
            box_top_right,
            box_bottom_left,
            box_bottom_right
        ]

        @sequence_boxes = {
            box_top_left.color_symbol     => box_top_left,
            box_top_right.color_symbol    => box_top_right,
            box_bottom_left.color_symbol  => box_bottom_left,
            box_bottom_right.color_symbol => box_bottom_right
        }

        # input_boxes.each do |box|
        #     box.fill_check
        # end
        #refresh_boxes(input_boxes)
        sleep 2
    end




    def display_sequence(color_symbols)
        #debugger
        color_symbols.each do |color|
            @sequence_boxes[color].show_color
        end
    end

    def acquire_check_answer(color_symbols)
        i = 0
        while i < color_symbols.length
            c = Curses.getch
            case c
            when Curses::KEY_MOUSE
                m = Curses.getmouse
                @input_boxes.each do |box|
                    box_color_clicked = box.click_check(m.x, m.y)
                    if  box_color_clicked != nil
                        box_clicked = @sequence_boxes[box_color_clicked]
                        if box_color_clicked == color_symbols[i]
                            box_clicked.display_correct
                            i += 1
                        else
                            box_clicked.display_wrong
                            return false
                        end
                    end
                end

             end
         end

         return true #if true display sucess
    end



    def success
        @input_boxes.each do |box|
            box.display_success
        end

        sleep 0.5

        @input_boxes.each do |box|
            box.display_default
        end
        sleep 0.5
    end

    def display_score(length)
        @input_boxes.each do |box|
            box.hide
        end
        new_win = Curses::Window.new(Curses.lines / 2, Curses.cols / 2, Curses.lines / 4, Curses.cols / 4)
        new_win.color_set(0)
        done_message = "HERE IS YOUR SCORE : #{length}"
        new_win.setpos(Curses.lines/2,Curses.cols/2 - done_message.length)
        new_win.addstr(done_message)
        new_win.refresh
        sleep 2
        # new_win.color_set(10)
        # new_win.clear
        # new_win.refresh
        # Curses.refresh
        # Curses.clear
        # Curses.refresh
        #Curses.close_screen
    end

    def restart
        @input_boxes.display_default
    end

    private

    def refresh_boxes(boxes)
        boxes.each do |box|
            # box.fill_check
            box.refresh
        end
    end

    def create_color(color)
        case color
        when :blue
            Curses::COLOR_BLUE
        when :green
            Curses::COLOR_GREEN
        when :red
            Curses::COLOR_RED
        when :yellow
            Curses::COLOR_YELLOW
        else
            Curses::COLOR_BLACK
        end
    end


end

#Display.new([:red,:blue,:green,:yellow]).run

#box_pos_x =

# #box_top_left.fill("W", :red)
#
# box_top_left.win.setpos(10,10)
# box_top_left.win.addstr("HELLO")
# box_top_right.win.setpos(20,10)
# box_top_right.win.addstr("HELLO")


# require 'curses'
#
# Curses.init_screen
# Curses.curs_set(0)  # Invisible cursor
#
# begin
#   # Building a static window
#   win1 = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols / 2 - 1, 0, 0)
#   win1.box("o", "o")
#   win1.setpos(2, 2)
#   win1.addstr("Hello")
#   win1.refresh
#
#   # In this window, there will be an animation
#   win2 = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols / 2 - 1,
#                             Curses.lines / 2, Curses.cols / 2)
#   win2.box("|", "-")
#   win2.refresh
#   2.upto(win2.maxx - 3) do |i|
#     win2.setpos(win2.maxy / 2, i)
#     win2 << "*"
#     win2.refresh
#     sleep 0.05
#   end
#
#   # Clearing windows each in turn
#   sleep 0.5
#   win1.clear
#   win1.refresh
#   win1.close
#   sleep 0.5
#   win2.clear
#   win2.refresh
#   win2.close
#   sleep 0.5
# rescue => ex
#   Curses.close_screen
# end




# require 'curses'
#
# Curses.init_screen
# begin
#   message = "Hello World"
#
#   win = Curses.stdscr
#
#   #______message shits_____________
#   x = (win.maxx - message.length) / 2
#   y = win.maxy / 2
#   win.setpos(y, x) #set's position of message
#   win.addstr(message)
#   #________________________________
#   win.refresh
#   win.getch
# ensure
#   Curses.close_screen
# end
