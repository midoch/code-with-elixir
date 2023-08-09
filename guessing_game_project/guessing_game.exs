defmodule GuessingGame do
  # Function to start the game
  def start do
    IO.puts("Welcome to the Guessing Game!")

    # Generate a random target number between 1 and 20
    target = generate_random_number(1, 20)

    # Start the game loop
    play(1, 20, target)
  end

  # Function to generate a random number within a range
  defp generate_random_number(min, max) do
    :rand.uniform(max - min + 1) + min
  end

  # Main game loop
  defp play(low, high, target) when low <= high do
    IO.puts("Guess a number between #{low} and #{high}:")
    guess = IO.read(:stdio, :line) |> String.trim() |> String.to_integer()

    # Compare the player's guess with the target number
    case compare_guess(guess, target) do
      :correct ->
        IO.puts("Congratulations! You guessed the correct number #{target}!")

      :too_high ->
        IO.puts("Your guess is too high.")
        play(low, guess - 1, target)

      :too_low ->
        IO.puts("Your guess is too low.")
        play(guess + 1, high, target)
    end
  end

  # Function to compare the player's guess with the target number
  defp compare_guess(guess, target) when guess == target, do: :correct
  defp compare_guess(guess, target) when guess > target, do: :too_high
  defp compare_guess(guess, target) when guess < target, do: :too_low
end

# Start the game when the module is compiled
GuessingGame.start()
