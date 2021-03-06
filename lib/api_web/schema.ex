defmodule ApiWeb.Schema do
  use Absinthe.Schema

  import_types Api.Accounts.Types
  import_types Api.Accounts.Queries
  import_types Api.Accounts.Mutations

  import_types Api.Map.Types
  import_types Api.Map.Queries
  import_types Api.Map.Mutations

  import_types Api.Session.Types
  import_types Api.Session.Mutations

  query do
    import_fields :accounts_queries
    import_fields :map_queries
  end

  mutation do
    import_fields :accounts_mutations
    import_fields :map_mutations
    import_fields :session_mutations
  end

  @doc """
  https://hexdocs.pm/absinthe/Absinthe.Middleware.html#module-the-callback
  handle and format changeset errors during mutations
                                     %{identifier: identifier}) when identifier in [:mutation, :blablba] do
  """
  def middleware(middleware, _field, %Absinthe.Type.Object{identifier: :mutation}) do
    middleware ++ [ApiWeb.Middleware.ChangesetErrorFormatter]
  end

  def middleware(middleware, _, _) do
    middleware
  end

end
