defmodule MyAgent do
  use GenServer

  def start(fun, options \\ []), do:
    GenServer.start(__MODULE__, fun, options)

  def stop(name), do: GenServer.stop(name)

  def init(fun), do: {:ok, fun.()}

  def get(name, fun), do: GenServer.call(name, {:get, fun})

  def update(name, fun), do: GenServer.call(name, {:update, fun})

  def handle_call({:get, fun}, _from, state), do:
    {:reply, fun.(state), state}
  def handle_call({:update, fun}, _from, state), do:
    {:reply, :ok, fun.(state)}
  def handle_call(request, from, state), do:
    super(request, from, state)

end
