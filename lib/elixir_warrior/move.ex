defmodule Warrior do
  defstruct direction: :xpos
end

defmodule Cell do
  defstruct x: 0, y: 0, content: :empty
end

defmodule ElixirWarrior.Move do
  def walk(world) do
    world |>
    find_warriors_cell |>
    run_turn(world)
  end

  def run_turn(%Cell{x: x, y: y, content: %Warrior{direction: :xpos}}, world) do
    [current_warriors_cell, world_without_warrior] = find_cell(x, y, world)
    [warriors_next_cell, world_without_next_cell] = find_cell(x + 1, y, world_without_warrior)
    warriors_next_cell = %{warriors_next_cell | content: current_warriors_cell.content}
    current_warriors_cell = %{current_warriors_cell| content: :empty}
    [warriors_next_cell, current_warriors_cell | world_without_next_cell]
  end

  defp find_warriors_cell(world) do
    Enum.find(world, fn(cell)->
      case cell.content do
        %Warrior{} -> true
        _ -> false
      end
    end)
  end

  defp find_cell(x, y, world) do
    cell = Enum.find(world, fn(cell)->
      case cell do
        %Cell{x: ^x, y: ^y} -> true
        _ -> false
      end
    end)
    new_world_without_cell = Enum.filter(world, fn(cell)->
      case cell do
        %Cell{x: ^x, y: ^y} -> false
        _ -> true
      end
    end)
    [cell, new_world_without_cell]
  end
end
