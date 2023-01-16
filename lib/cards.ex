defmodule Cards do
@moduledoc """
  Creates and deal cards.
  """

@doc """
  Creates a new deck.
"""

 def create_deck() do
   values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Queen", "Jack", "King"]
   suits = ["Hearts", "Spades", "Clubs", "Diamonds"]

   for suit <- suits, value <- values do
    "#{value} of #{suit}"
   end
 end

@doc """
  Suffles a `deck`.
"""

 def shuffle(deck) do
    Enum.shuffle(deck)
 end

@doc """
  Check if there is a `card` in the `deck`.
"""

 def contains?(deck, card) do
    Enum.member?(deck, card)
 end

@doc """
  Divides a deck into a hand of cards and the rest.
  The `hand_size` argument indicates the number of cards of the hand.
"""

 def deal(deck, hand_size) do
   Enum.split(deck, hand_size)
 end

@doc """
  Saves a deck in file named with `filename`
"""

 def save(deck, filename) do
   binary = :erlang.term_to_binary(deck)
   File.write(filename, binary)
 end

@doc """
  Loads a deck from a file with the name `filename`.
"""

 def load(filename) do
  case File.read(filename) do
    {:ok, binary} -> :erlang.binary_to_term(binary)
    {:error, _reason} -> "That file does not exist"
  end
 end

@doc """
  Creates a hand based on `hand_size`.
"""

 def create_hand(hand_size) do
   Cards.create_deck
   |>Cards.shuffle
   |>Cards.deal(hand_size)
 end

end
