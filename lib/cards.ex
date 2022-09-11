defmodule Cards do
@moduledoc """
  Creates and deal cards.
  """

@doc """
  Creates a new deck.

"""

 def create_deck() do
   values = ["Ás", "Dois", "Tres", "Quatro", "Cinco", "Seis", "Sete", "Dama", "Valete", "Reis"]
   suits = ["Ouros", "Espadas", "Zap", "Copas"]

   for suit <- suits, value <- values do
    "#{value} de #{suit}"
   end
 end

@doc """
  Suffles a `deck`.

## Exemples

      iex> deck = Cards.create_deck
      iex> shuffled_deck = Cards.shuffle(deck)
      iex> shuffled_deck === deck
      iex> true

"""

 def shuffle(deck) do
    Enum.shuffle(deck)
 end

@doc """
  Check if there is a `card` in the `deck`.

## Exemples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ás de Zap")
      iex> true

"""

 def contains?(deck, card) do
    Enum.member?(deck, card)
 end

@doc """
  Divides a deck into a hand of cards and the rest.
  The `hand_size` argument indicates the number of cards of the hand.

## Exemples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ás de Ouros"]

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

 def create_hand(hand_size) do
   Cards.create_deck
   |>Cards.shuffle
   |>Cards.deal(hand_size)
 end

end
