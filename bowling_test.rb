require 'minitest/autorun'
require_relative 'bowling.rb'

class BowlingTest < Minitest::Test
    def test_bowling
        scores = [
            [1, 0],
            [2, 3],
            [1, 7],
            [10],
            [10],
            [10],
            [10],
            [10],
            [10],
            [10, 10, 10]
        ]
        assert_equal 300, Bowling.new(scores).result
    end
end