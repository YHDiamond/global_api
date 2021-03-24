defmodule GlobalApiWeb.SkinController do
  use GlobalApiWeb, :controller
  alias GlobalApi.Repo
  alias GlobalApi.Utils

  def get_skin(conn, %{"xuid" => xuid}) do
    case Utils.is_int_and_rounded(xuid) do
      false ->
        conn
        |> put_status(:bad_request)
        |> put_resp_header("cache-control", "max-age=604800, s-maxage=604800, immutable, public")
        |> json(%{success: false, message: "xuid should be an int"})

      true ->
        {_, result} = Cachex.fetch(:xuid_to_skin, xuid, fn(xuid) ->
          case Repo.get_skin_by_xuid(xuid) do
            :not_found ->
              {:ignore, :not_found}
            {_, _, _, _, _, _} = data ->
              {:commit, data}
          end
        end)

        if result == :not_found do
          conn
          |> put_resp_header("cache-control", "max-age=1800, s-maxage=1800, public")
          |> json(%{success: true, data: %{}})
        else
          {hash, texture_id, value, signature, is_steve, last_update} = result
          conn
          |> put_resp_header("cache-control", "max-age=900, s-maxage=900, public")
          |> json(%{success: true, data: %{hash: hash, texture_id: texture_id, value: value, signature: signature, is_steve: is_steve, last_update: last_update}})
        end
    end
  end
end