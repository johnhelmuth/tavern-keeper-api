module JsonStore
	extend ActiveSupport::Concern
  included do
  	after_find :set_data

    def self.field(key, type = :string)
			key = key.to_s
			case type.to_sym
			when :string
				string_field(key)
			when :hash
				scrub_field(key)
			when :array
				scrub_field(key)
			when :integer
				integer_field(key)
			when :boolean
				boolean_field(key)
			when :date
				date_field(key)
			when :null
				remove_field(key)
			end
		end

		private


		def self.read_field(key)
			define_method("#{key}") do
	      data[key.to_s]
	    end
		end

		def self.read_date_field(key)
			define_method("#{key}") do
				# DateTime.parse(data[key.to_s].to_s)
				data[key.to_s]
			end
		end

		def self.string_field(key)
			read_field(key)

	    define_method("#{key}=") do |value|
	    	value = value.to_s
	      value = Loofah.fragment(value).scrub!(:strip).to_s
	      self.data= self.data.merge({key.to_s => value})
	    end
		end

		def self.date_field(key)
			read_date_field(key)

	    define_method("#{key}=") do |value|
	    	value = value.to_s
	      self.data= self.data.merge({key.to_s => value})
	    end
		end

		def self.srcub_field(key)
			read_field(key)

	    define_method("#{key}=") do |value|
	    	value = TavernKeeper::Scrub.scrub(value)
	      self.data= self.data.merge({key.to_s => value})
	    end
		end

		def self.integer_field(key)
			read_field(key)

	    define_method("#{key}=") do |value|
	      self.data= self.data.merge({key.to_s => value.to_i})
	    end
		end

		def self.boolean_field(key)
			read_field(key)

	    define_method("#{key}=") do |value|
	      self.data= self.data.merge({key.to_s => value == true})
	    end
		end

		def self.remove_field(key)
			define_method("remove_data_#{key}") do
				if self.data.has_key?(key.to_s)
					temp = self.data
					temp.delete(key.to_s)
					self.data= temp
				end
			end
			after_find :"remove_data_#{key}"
		end
  end

  def set_data
  	data = {} if data.nil?
  end
end
