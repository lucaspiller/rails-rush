class PageHeaderComponent < ViewComponent::Base
  erb_template <<~ERB
    <header class="px-8 py-6 mb-6 border-b">
      <h1 class="text-2xl font-semibold mb-2">
        <%= @title %>
      </h1>
      <%= content %>
    </header>
  ERB
  
  def initialize(title:)
    @title = title
  end
end
