defmodule ExDo do

  use HTTPoison.Base
  alias ExDo.Client
  alias ExDo.Structs.Droplets

  @user_agent [{"User-agent", "ex_do"}]

  # @type response :: {integer, any} | :jsx.json_term

  # @spec process_response_body(binary) :: term
  # def process_response_body(""), do: nil
  # def process_response_body(body), do: JSX.decode!(body)

  # @spec process_response(HTTPoison.Response.t) :: response
  # def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: body
  # def process_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, body }

  def delete(path, client, body \\ "") do
    _request(:delete, url(client, path), client.auth, body)
  end

  def post(path, client, body \\ "") do
    _request(:post, url(client, path), client.auth, body)
  end

  def patch(path, client, body \\ "") do
    _request(:patch, url(client, path), client.auth, body)
  end

  def put(path, client, body \\ "") do
    _request(:put, url(client, path), client.auth, body)
  end

  def get(path, client, body \\ "") do
    _request(:get, url(client, path), client.auth, body)
  end

  def _request(method, url, auth, body \\ "") do
    json_request(method, url, body, authorization_header(auth, @user_agent))
  end

  def json_request(method, url, body \\ "", headers \\ [], options \\ []) do
    raw_request(method, url, Poison.encode!(body), headers, options)
  end

  def raw_request(method, url, body \\ "", headers \\ [], options \\ []) do
    request!(method, url, body, headers, options)
  end

  @spec url(client :: Client.t, path :: binary) :: binary
  defp url(_client = %Client{endpoint: endpoint}, path) do
    endpoint <> path
  end

  @spec authorization_header(Client.auth, list) :: list
  def authorization_header(%{access_token: token}, headers) do
    headers ++ [{"Content-Type", "application/json"}, {"Authorization", "Bearer #{token}"}]
  end

  def authorization_header(_, headers), do: headers
  def authorization_header(options), do: authorization_header(options, @user_agent)

end
