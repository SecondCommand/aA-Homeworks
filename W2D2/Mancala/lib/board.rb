class Board
  attr_accessor :cups
require "byebug"
  def initialize(name1, name2)
    @player_name1 = name1
    @player_name2 = name1
    @cups = Array.new(14){[]}
    four_stones =  [:stone, :stone, :stone, :stone]
    @cups.map!.with_index do |cup, idx|
      idx != 6 && idx != 13 ? cup = four_stones.dup : []
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (1..14) === start_pos
  end

  def make_move(start_pos, current_player_name)
   
    if current_player_name == @player_name1
       current_player_base = 6
       idx_to_skip = 13
    else 
      current_player_base = 13
      idx_to_skip = 6
    end

    hand = @cups[start_pos].dup
    @cups[start_pos] = []
    idx = start_pos
    until hand.empty?
      idx = (idx + 1) % @cups.length
     # debugger
      @cups[idx] << hand.pop unless idx == idx_to_skip
    end
    render
    
    next_turn(idx)
    
  end

  def next_turn(ending_cup_idx)
 
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    left_empty = @cups[0..5].none?{|cup| cup.count > 0}
    right_empty = @cups[7..12].none?{|cup| cup.count > 0}
    left_empty || right_empty
  end

  def winner
    player_one_cup = @cups[6]
    player_two_cup = @cups[13]
    return :draw if player_one_cup.count == player_two_cup.count
    return @player_name1 if player_one_cup.count <= player_two_cup.count 
    return @player_name2
  end
end
