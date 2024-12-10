 class FormSectionComponent < ViewComponent::Base
  erb_template <<~ERB
    <hr/>
    <div class="flex my-6 gap-6">
      <div class="w-1/4">
        <h2 class="font-semibold"><%= @title %></h2>
        <%- if @subtitle %>
        <p class="text-sm"><%= @subtitle %></p>
        <%- end %>
      </div>
      <div class="w-3/4">
        <%= content %>
      </div>
    </div>
ERB

  def initialize(title:, subtitle: nil)
    @title = title
    @subtitle = subtitle
  end
 end
