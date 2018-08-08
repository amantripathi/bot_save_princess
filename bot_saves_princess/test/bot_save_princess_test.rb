require_relative '../lib/bot_save_princess.rb'
require 'minitest/autorun'
require 'stringio'

module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end

class BotSavePrincessTest < Minitest::Test
  def test_route_to_princess_can_output_path_for_3_x_3_grid
    out = capture_stdout do
      bot = BotSavePrincess.new(3, ["---",
                                  "-m-",
                                  "--p"])
      bot.route_to_princess
    end

    assert_equal "DOWN\nRIGHT\n", out.string
  end

  def test_route_to_princess_can_output_path_for_5_x_5_grid
    out = capture_stdout do
      bot = BotSavePrincess.new(5, ["-----",
                                  "-----",
                                  "--m--",
                                  "-----",
                                  "p----"])
      bot.route_to_princess
    end
    assert_equal "DOWN\nDOWN\nLEFT\nLEFT\n", out.string
  end

  def test_route_to_princess_can_output_path_for_7_x_7_grid
    out = capture_stdout do
      bot = BotSavePrincess.new(7, ["------p",
                                  "-------",
                                  "-------",
                                  "---m---",
                                  "-------",
                                  "-------",
                                  "-------"])
      bot.route_to_princess
    end
    assert_equal "UP\nUP\nUP\nRIGHT\nRIGHT\nRIGHT\n", out.string
  end
end
