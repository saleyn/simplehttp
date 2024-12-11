defmodule SimpleHttp.Response do
  @moduledoc """
  Defines a http response
  """
  @type t :: %__MODULE__{}

  defstruct status: nil,
            statusline: nil,
            headers: [],
            body: nil,
            profile: nil
end
