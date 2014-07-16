module ApiTokenSupport
  def auth_header(api_key = nil)
    if api_key.nil?
      @api_key ||= create(:api_key) if api_key.nil? 
      api_key = @api_key
    end
    {'x-key' => api_key.id, 'x-secret' => api_key.secret}
  end
  
  def auth_header_for_js(api_key = nil)
    api_key = create(:api_key) if api_key.nil? 
    {'x-key' => api_key.id, 'host' => api_key.origins.first}
  end

end
