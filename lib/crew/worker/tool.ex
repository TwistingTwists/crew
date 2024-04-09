defmodule Crew.Worker.Tools do
  @moduledoc false
  defstruct [:name, :tools]

  @schema [
    name: [type: :atom, required: true, doc: "A name for colleciton of tools"]
  ]

  def schema, do: @schema

  def transform(step) do
    "#{__MODULE__} tranform was called" |> IO.inspect(label: "#{Path.relative_to_cwd(__ENV__.file)}:#{__ENV__.line}")
    {:ok, step}
  end
end
