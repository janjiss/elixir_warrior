defmodule ElixirWarrior.MoveTest do
  use ExUnit.Case
  test "creates new state if :walk is passed" do
    world = [%Cell{x: 0, y: 0, content: %Warrior{}}, %Cell{x: 1, y: 0}, %Cell{x: 2, y: 0}, %Cell{x: 3, y: 0}, %Cell{x: 4, y: 0, content: :stairs}]
    new_world = [%Cell{x: 0, y: 0}, %Cell{x: 1, y: 0, content: %Warrior{}}, %Cell{x: 2, y: 0}, %Cell{x: 3, y: 0}, %Cell{x: 4, y: 0, content: :stairs}]
    assert Enum.sort(ElixirWarrior.Move.walk(world)) == Enum.sort(new_world)
  end
end
