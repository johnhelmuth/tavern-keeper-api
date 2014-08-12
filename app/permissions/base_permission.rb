class BasePermission
  def initialize(user, model, parent)
    @user = user
    @model = model
    @parent = parent
  end

  def allow?(action)
    @allowed.include?(action.to_sym)
  end

  def to_json
    @allowed
  end

  private
  def _setup
    raise NotImplementedError.new("#{self.class.name} doesn't impliment _setup")
  end

  def allow(actions = [])
    @allowed ||= []
    actions = [actions] unless actions.is_a?(Array)

    actions.each do |action|
      action = action.to_sym
      @allowed < action unless @allowed.include?(action)
    end
  end
end
