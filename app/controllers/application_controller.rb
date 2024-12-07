class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  layout :layout_by_resource

  helper_method :current_account

  protected

  def current_account
    @__current_account ||= begin
      account = if params[:account_slug]
                  Account.find_by(slug: params[:account_slug])
                elsif session[:account_slug]
                  Account.find_by(slug: session[:account_slug])
                else
                  current_user.accounts.first
                end

      session[:account_slug] = account.try(:slug)

      account
    end
  end

  def default_url_options
    if user_signed_in?
      { path_params: { account_slug: current_account.slug } }
    else
      {}
    end
  end

  def layout_by_resource
    if user_signed_in?
      "application"
    else
      "public"
    end
  end
end
