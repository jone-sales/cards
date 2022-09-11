defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck must return 44 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 40
  end

end
