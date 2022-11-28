defmodule BugWeb.BugComponent do
  use Phoenix.LiveComponent

  import BugWeb.CoreComponents

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p><%= @status %></p>
      <.button phx-click="trigger" phx-target={@myself}>Trigger</.button>
    </div>
    """
  end

  @impl true
  def handle_event("trigger", _, socket) do
    pid = self()

    Task.Supervisor.async_nolink(Bug.TaskSupervisor, fn ->
      send_update(pid, __MODULE__, id: socket.assigns.id, status: "ok")
    end)

    {:noreply, socket}
  end
end
