class CampaignPermission < Permission

  private
  def _setup
    # allow :index
    allow :get
    allow :post if @user.present?
  end
end
