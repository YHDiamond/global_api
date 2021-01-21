defmodule GlobalLinkingWeb.XboxController do
  use GlobalLinkingWeb, :controller

  def got_token(conn, %{"code" => code, "state" => state}) do
    {:ok, correct_state} = Cachex.get(:xbox_api, :state)
    if String.equivalent?(correct_state, state) do
      case GlobalLinking.XboxApi.got_token(code) do
        :ok -> json(conn, :ok)
        {:error, reason} -> json(conn, %{error: reason})
      end
    else
      json(conn, "I'm sorry, but what did you try to do?")
    end
  end

  def got_token(conn, _) do
    json(conn, "I'm sorry, but what did you try to do?")
  end

  def get_gamertag(conn, %{"xuid" => xuid}) do
    {_, gamertag} = Cachex.fetch(:get_gamertag, xuid, fn _ ->
      case GlobalLinking.XboxApi.get_gamertag(xuid) do
        :not_setup -> {:ignore, :not_setup}
        gamertag -> {:commit, gamertag}
      end
    end)

    case gamertag do
      :not_setup ->
        json(
          conn,
          %{
            success: false,
            message: "The Xbox Api isn't setup correctly. Please contact a GeyserMC developer"
          }
        )
      nil ->
        json(conn, %{success: true, data: %{}})
      gamertag ->
        json(
          conn,
          %{
            success: true,
            data: %{
              gamertag: gamertag
            }
          }
        )
    end
  end

  def get_gamertag(conn, _) do
    json(conn, %{success: false, message: "You have to provide a xuid to get a gamertag back"})
  end

  def get_xuid(conn, %{"gamertag" => gamertag}) do
    {_, xuid} = Cachex.fetch(:get_xuid, gamertag, fn _ ->
      case GlobalLinking.XboxApi.get_xuid(gamertag) do
        :not_setup -> {:ignore, :not_setup}
        xuid -> {:commit, xuid}
      end
    end)

    case xuid do
      :not_setup ->
        json(
          conn,
          %{
            success: false,
            message: "The Xbox Api isn't setup correctly. Please contact a GeyserMC developer"
          }
        )
      nil ->
        json(conn, %{success: true, data: %{}})
      xuid ->
        json(
          conn,
          %{
            success: true,
            data: %{
              xuid: xuid
            }
          }
        )
    end
  end

  def get_xuid(conn, _) do
    json(conn, %{success: false, message: "You have to provide a gamertag to get a xuid back"})
  end
end
