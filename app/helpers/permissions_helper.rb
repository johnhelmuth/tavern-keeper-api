module PermissionsHelper
  def allow?
    m = params['route_info'].route_method.downcase.to_sym
    m = :index if m == :get && @model.nil?

    error!('Unauthorized', 401) unless current_permission.allow?(m)
  end

  def current_permission
    if @klass.nil?
        @klass = @model.nil? ? @collection.klass : @model.class
    end
    @current_permission ||= Permission.for(@klass, @model, current_user, params) if @klass
  end
end
