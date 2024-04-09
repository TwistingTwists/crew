[
  import_deps: [
    # :ash_admin,
    # :ash_oban,
    # :ash_postgres,
    # :ash_state_machine,
    :ash,
    :ecto_sql,
    :ecto,
    :phoenix
  ],
  line_length: 130,
  # :typedstruct],
  subdirectories: ["priv/*/migrations"],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"]
]
