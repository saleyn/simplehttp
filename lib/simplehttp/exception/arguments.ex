defmodule SimpleHttp.Exception.BadArgument do
  @moduledoc """

  The module SimpleHttp.Exception.BadArgument defines a custom exception for handling bad argument errors in HTTP requests.

  ## Description

  It implements the Exception behavior, providing a standard way to raise and manage exceptions related to invalid arguments passed to HTTP functions. This module can be used throughout the SimpleHttp application to signal that an argument does not meet the expected criteria, ensuring better error handling and debugging during HTTP operations.
  """
  defexception message: "Bad Argument Exception"
end
