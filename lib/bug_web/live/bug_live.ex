defmodule BugWeb.BugLive do
  use BugWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    test the bug <.live_component module={BugWeb.BugComponent} id="Id" status="before" />
    """
  end
end
