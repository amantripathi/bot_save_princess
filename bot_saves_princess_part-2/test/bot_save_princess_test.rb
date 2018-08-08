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
  def test_next_move_for_princess_above
    out = capture_stdout do
      bot = BotSavePrincess.new(3, 1, 1, ["-p-", "-m-", "---"])
      bot.next_move
    end

    assert_equal "UP\n", out.string
  end

  def test_next_move_for_princess_below
    out = capture_stdout do
      bot = BotSavePrincess.new(5, 2, 1, ["-----", "-----", "-m---", "-----", "-p---"])
      bot.next_move
    end
    assert_equal "DOWN\n", out.string
  end

  def test_next_move_for_princess_left
    out = capture_stdout do
      bot = BotSavePrincess.new(5, 2, 3, ["-----", "-----", "p--m-", "-----", "-----"])
      bot.next_move
    end
    assert_equal "LEFT\n", out.string
  end

  def test_next_move_for_princess_right
    out = capture_stdout do
      bot = BotSavePrincess.new(5, 2, 1, ["-----", "-----", "-m--p", "-----", "-----"])
      bot.next_move
    end
    assert_equal "RIGHT\n", out.string
  end
end
