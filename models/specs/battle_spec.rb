require("minitest/autorun")
require("minitest/rg")
require_relative("../battle")

class TestBattle < Minitest::Test

  def setup
    options = {
      "id" => 1,
      "player1_id" => 1,
      "player2_id" => 2,
      "outcome" => 1
    }

    @battle = Battle.new(options)
  end

  def test_wins
    assert_equal(1, @battle.wins())
  end

end
