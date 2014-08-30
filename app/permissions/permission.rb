class Permission
  def self.for(klass, model, user, options = {})
    puts "#{klass.name}Permission"
    # Kernal.get_const("#{klass.name}Permission")
  end
end
