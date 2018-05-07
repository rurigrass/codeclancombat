require("minitest/autorun")
require("minitest/rg")
require_relative("../player")

class TestPlayer < MiniTest::Test

  def setup
    options = {
      "id" => 1,
      "name" => "Ruri",
      "strength" => 2,
      "ability" => 5
    }

    @player = Player.new(options)
  end

  def test_power
    assert_equal(7, @player.power())
  end

end
