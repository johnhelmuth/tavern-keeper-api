module DataFields
  extend ActiveSupport::Concern
  included do
    after_initialize :set_data

    def self.field(key, type = :string)
      key = key.to_s
      case type.to_sym
      when :string
        string_field(key)
      when :text
        scrub_field(key)
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
        @data = {} if @data.nil?
        @data[key.to_s] ||= _fetch(key.to_s)
      end
    end

    def self.string_field(key)
      read_field(key)

      define_method("#{key}=") do |value|
        value = value.to_s
        value = Loofah.fragment(value).scrub!(:strip).to_s
        @data[key.to_s] = value
        json = {value: value }
        data_stores.where(key: key.to_s).delete_all
        data_stores.create(key: key.to_s, value: json)
      end
    end

    def self.date_field(key)
      read_field(key)

      scrub_field(key)
    end

    def self.scrub_field(key)
      read_field(key)

      define_method("#{key}=") do |value|
        value = ::TavernKeeper::Scrubber.scrub(value)
        @data[key.to_s] = value
        json = {value: value }
        data_stores.where(key: key.to_s).delete_all
        data_stores.create(key: key.to_s, value: json)
      end
    end

    def self.integer_field(key)
      read_field(key)

      define_method("#{key}=") do |value|
        @data[key.to_s] = value
        data_stores.where(key: key.to_s).delete_all
        json = {value: value }
        data_stores.create(key: key.to_s, value: json)
      end
    end

    def self.boolean_field(key)
      read_field(key)

      define_method("#{key}=") do |value|
        @data[key.to_s] = value
        data_stores.where(key: key.to_s).delete_all
        json = {value: value == true }
        data_stores.create(key: key.to_s, value: json)
      end
    end

    def self.remove_field(key)

    end

    def _fetch(key)
      (data_stores.where(key: key).first.try(:value) || {})['value']
    end
  end

  def set_data
    @data = {}
  end
end
