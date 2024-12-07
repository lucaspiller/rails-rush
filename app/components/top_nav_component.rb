# frozen_string_literal: true

class TopNavComponent < ViewComponent::Base
  erb_template <<~ERB
    <div class="mb-6 sticky top-0 bg-white shadow-lg">
    <div class="max-w-screen-2xl flex justify-between items-center px-8 py-2 mx-auto">
      <div class="flex items-center font-bold text-xl my-4 breadcrumbs">
        <% breadcrumbs.each_with_index do |breadcrumb| %>
          <div><%= breadcrumb %></div>
        <% end %>
      </div>
      <div class="flex justify-items-center">
        <% buttons.each do |button| %>
          <%= button %>
        <% end %>
      </div>
    </div>
  </div>
ERB


  renders_many :breadcrumbs, ->(title, path = nil) {
    if path
      link_to title, path
    else
      title
    end
  }

  renders_many :buttons

  def breadcrumb(title, path = nil)
    if path
      with_breadcrumb helpers.link_to(title, path)
    else
      with_breadcrumb title
    end
  end
end
