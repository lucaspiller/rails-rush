# frozen_string_literal: true

class MainContentComponent < ViewComponent::Base
  erb_template <<~ERB
    <div class="px-8">
      <%= render "shared/flash" %>

      <%= content %>
    </div>
ERB
end
