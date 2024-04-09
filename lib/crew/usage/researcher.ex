defmodule Crew.Usage.Researcher do
  use Ash.Resource, extensions: [Crew.Worker.DSL]

  attributes do
    uuid_primary_key(:id)

    attribute(:role, :string, default: "Local Expert at this city")
    attribute(:goal, :string, default: "Provide the BEST insights about the selected city")
    attribute(:backstory, :string, default: "A knowledgeable local guide with extensive information
    about the city, it's attractions and customs")
  end

  tools :researcher do
    tool(:do_browse_web, after: & &1)
  end
end
