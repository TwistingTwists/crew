defmodule Crew.Usage.Api do
  use Ash.Api

  resources do
    resource(Crew.Usage.Researcher)
  end
end
