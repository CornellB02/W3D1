class Board

    attr_reader :size

    def initialize(size)
        @size = size
        @grid = Array.new(size) {Array.new(size) }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.any?{|row| row.all? {|pos| pos == mark}}
    end

    def complete_col?(mark)
        @grid.transpose.any?{|row| row.all? {|pos| pos == mark}}
    end

    def complete_diag?(mark)
        count1, count2 = 0, 0

        (0...@grid.length).each do |i|
            count1 += 1 if @grid[i][i] == mark
            count2 += 1 if @grid[i][@grid.length - i - 1] == mark
        end
        count1 == @grid.length  || count2 == @grid.length 
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
