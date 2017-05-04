defmodule Exsoda.Domain do
  alias Exsoda.Http

  defmodule Current do
    defstruct opts: []
  end

  defmodule ById do
    defstruct id: 0, opts: []
  end

  def current(opts \\ []), do: %Current{opts: Http.options(opts)}

  def by_id(id, opts \\ []) when is_integer(id), do: %ById{id: id, opts: Http.options(opts)}

  def run(%Current{} = q), do: Http.get("/domains", q)
  def run(%ById{id: id} = q), do: Http.get("/domains/#{id}", q)
end