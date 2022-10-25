class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, index|
      next if index == 6 || index == 13
      4.times do 
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,13)
      raise "Invalid starting cup"
    end
    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    #removing stones from the cup
    stones = @cups[start_pos]
    @cups[start_pos] = []

    #placing stones in cups
    cup_index = start_pos
    until stones.empty?
      cup_index += 1
      cup_index = 0 if cup_index > 13
      #placing stones in the current player's cups
      if cup_index == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_index == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_index] << stones.pop
      end
    end

    render
    next_turn(cup_index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
        #choose new place to start on your side
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      # if ended on empty cup, we switch players
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
    @cups[1..6].all? {|cup| cup.empty?} ||
    @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end
