defmodule ApiWeb.Context do
  @behaviour Plug

  import Plug.Conn
  import Logger

  def init(opts), do: opts

  def call(conn, _opts) do
    res = Guardian.Plug.current_resource(conn)
    Logger.info("CONTEXT PLUG")
    IO.inspect(res)

    case res do
      nil ->
        conn

      user ->
        put_private(conn, :absinthe, %{context: %{current_user: user}})
    end
  end
end
