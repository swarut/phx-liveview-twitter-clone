defmodule TwitterCloneWeb.PostLive.PostComponent do
  use TwitterCloneWeb, :live_component

  def render(assigns) do
    ~L"""
    <div id="post-<%= @post.id %>" class="post">
      <div class="title"><%= @post.username %></div>
      <div><%= @post.body %></div>
      <div class="footer">
        <div>
          Like: <%= @post.likes_count %>
          (<a href="#" phx-click="like" phx-target="<%= @myself %>">+1</a>)
        </div>
        <div>
          Repost: <%= @post.reposts_count %>
          (<a href="#" phx-click="repost" phx-target="<%= @myself %>">+1</a>)
        </div>
        <div><%= live_patch "Edit", to: Routes.post_index_path(@socket, :edit, @post) %></div>
        <div><%= link "Delete", to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure?"] %></div>
      </div>
    </div>
    """
  end

  def handle_event("like", _, socket) do
    TwitterClone.Timeline.increase_like(socket.assigns.post)
    {:noreply, socket}
  end

  def handle_event("repost", _, socket) do
    TwitterClone.Timeline.repost(socket.assigns.post)
    {:noreply, socket}
  end
end
