class Permission
  def self.for(klass, model, user, options = {})
    Object.const_get("#{klass.name}Permission").new(model, user, options)
  end

  def initialize(model, user, options)
    @model = model
    @user = user
    @options = options || {}
    @allow = []
    _setup
  end

  def allow?(method)
    @allow.include?(method.to_sym)
  end

  def user
    @user
  end

  def model
    @model
  end

  private
  def _setup
      raise NotImplementedError.new("#{self.class.name} must impliment _setup")
  end

  def allow(method)
    @allow << method.to_sym
  end


end
