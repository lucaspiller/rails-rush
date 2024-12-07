# frozen_string_literal: true

class NavItemComponent < ViewComponent::Base
  def initialize(title:, path:, icon:, active_controllers: [], controller_matches: nil)
    @title = title
    @path = path
    @icon = icon
    @active_controllers = active_controllers
    @controller_matches = controller_matches
  end

  def before_render
    @active = if @controller_matches.is_a?(Regexp)
                @controller_matches.match?(controller.controller_path)
    else
                @active_controllers.include?(controller.controller_path)
    end
  end

  def call
    link_to @path, class: "nav-link #{@active ? 'nav-link-active' : ''}" do
      "<i class=\"fa-solid #{@icon}\"></i><span>#{@title}</span>".html_safe
    end
  end
end
