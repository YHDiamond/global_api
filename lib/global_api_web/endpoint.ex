defmodule GlobalApiWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :global_api

  # Live Dashboard and live code reload is only enabled during development
  if Mix.env() == :dev do
    # The session will be stored in the cookie and signed,
    # this means its contents can be read but not tampered with.
    # Set :encryption_salt if you would also like to encrypt it.
    @session_options [
      store: :cookie,
      key: "_global_api_key",
      signing_salt: "jvggC7w3"
    ]

    socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader

    plug Phoenix.LiveDashboard.RequestLogger,
         param_key: "request_logger",
         cookie_key: "request_logger"

    plug Plug.RequestId

    plug Plug.Session, @session_options
  end

  plug Plug.Parsers,
    parsers: [:multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  if Mix.env() == :prod do
    plug Plug.SSL, log: false
  end

  plug GlobalApiWeb.Router
end