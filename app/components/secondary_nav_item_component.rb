# frozen_string_literal: true

class SecondaryNavItemComponent < ViewComponent::Base
  erb_template <<~ERB
    <a class="secondary-nav-item #{@active ? 'secondary-nav-item-active' : ''}" href="#{@path}">
      #{@title}
    </a>
  ERB

  def initialize(title:, path:, active_controllers:)
    @title = title
    @path = path
    @active_controllers = active_controllers
  end

  def before_render
    @active = @active_controllers.include?(controller.controller_name)
  end
end
