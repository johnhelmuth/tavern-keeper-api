module AuthenticationHelper
  def authenticate!
    _set_api_key
    error!('Unrecognized Key', 500) if @api_key.nil?
  end
  
  def current_user
  end
  
  def current_api_key
    @api_key
  end
  
  def current_organization
    @api_key.organization
  end
  
  private 
  def _set_api_key
    if headers['X-Key'].present?
      @api_key = ApiKey.where(id: headers['X-Key']).first 
      if @api_key.present?
        @api_key = nil unless @api_key.secret == headers['X-Secret'] || @api_key.origins.include?(headers['Origin'])
      end
    end
  end
  
  def _set_user
    
  end
  
end