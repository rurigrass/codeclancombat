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

  def test_save
    assert_equal(2, @player.strength())
  end

  def test_ability
    assert_equal(5, @player.ability())
  end

end
