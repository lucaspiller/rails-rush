class Settings::AccountController < AuthenticatedController
  def edit; end

  def update
    respond_to do |format|
      if current_account.update(account_settings_params)
        format.html { redirect_to edit_settings_account_path, notice: 'Account settings were successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  protected

  def account_settings_params
    params.require(:account).permit(:name)
  end
end
