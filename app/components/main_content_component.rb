# frozen_string_literal: true

class MainContentComponent < ViewComponent::Base
  erb_template <<~ERB
    <div class="w-full px-8 max-w-screen-2xl mx-auto overflow-scroll">
      <%= render "shared/flash" %>

      <%= content %>
    </div>
ERB
end
