class Simon
  COLORS = %w(red blue green yellow) #array of colors

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    while @game_over == false
      take_turn
      system("clear")
    end

    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    
    if @game_over != true
      self.round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    self.add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the first letter of the color"
    @seq.each do |color|
      user_picked_color = gets.chomp
      if color[0] != user_picked_color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    random_color = COLORS.sample
    @seq << random_color
  end

  def round_success_message
    puts "Successful round"
  end

  def game_over_message
    puts "Game over! You passed #{@sequence_length-1} rounds"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
