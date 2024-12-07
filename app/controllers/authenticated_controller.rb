class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  helper_method :current_account

  layout "application"

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
    { path_params: { account_slug: current_account.slug } }
  end
end
