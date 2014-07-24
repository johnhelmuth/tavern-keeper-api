module PaginationHelper
  def page
    params[:page].to_i > 0 ? params[:page].to_i : 1
  end

  def set_page_headers
    unless @collection.nil?
      header 'X-Page', page.to_s
      header 'X-Pages', @collection.total_pages.to_s
    end
  end

end
