# frozen_string_literal: true

# move generator for King piece
class King
  attr_reader :name, :file, :rank, :parent, :color, :symbol

  MOVES = [[1, 0], [1, 1], [0, 1], [-1, -1], [-1, 0], [-1, 1], [0, -1], [1, -1]].freeze

  def initialize(file, rank, color, parent = nil)
    @file = file
    @rank = rank
    @name = 'K'
    @color = color
    @symbol = assign_symbol_by(color)
    @parent = parent
    @children = []
  end

  def assign_symbol_by(color)
    color == 'white' ? "\u2654" : "\u265A"
  end

  def where_can_jump
    MOVES.map { |row, col| [row + file, col + rank] }
         .select { |row, col| row.between?(0, 7) && col.between?(0, 7) }
         .map { |coords| King.new(*coords, color, self) }
  end
end
