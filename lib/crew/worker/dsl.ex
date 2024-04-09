defmodule Crew.Worker.DSL do
  @tool %Spark.Dsl.Entity{
    name: :tool,
    args: [:name],
    transform: {Crew.Worker.ToolStep, :transform, []},
    target: Crew.Worker.ToolStep,
    schema: Crew.Worker.ToolStep.schema()
  }

  @tools %Spark.Dsl.Entity{
    name: :tools,
    args: [:name],
    entities: [tools: [@tool]],
    transform: {Crew.Worker.Tools, :transform, []},
    target: Crew.Worker.Tools,
    schema: Crew.Worker.Tools.schema()
  }

  # @task %Spark.Dsl.Entity{
  #   name: :tool,
  #   args: [:name],
  #   transform: {Crew.Worker.ToolStep, :transform, []},
  #   target: Crew.Worker.ToolStep,
  #   schema: Crew.Worker.ToolStep.schema()
  # }

  # @tasks %Spark.Dsl.Entity{
  #   name: :tools,
  #   args: [:name],
  #   entities: [tools: [@tool]],
  #   transform: {Crew.Worker.Tools, :transform, []},
  #   target: Crew.Worker.Tools,
  #   schema: Crew.Worker.Tools.schema()
  # }

  @sections %Spark.Dsl.Section{
    name: :root,
    entities: [@tools],
    top_level?: true
  }

  @moduledoc false
  use Spark.Dsl.Extension,
    sections: [@sections],
    transformers: []
end
