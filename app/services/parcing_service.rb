class ParcingService

  ADAPTER_NAMES = {
    delimobil: Adapters::DelimobilPartner,
    car5: Adapters::Car5Partner,
    timcar: Adapters::TimcarPartner
  }.with_indifferent_access.freeze

  class << self
    def get_data adapter
      require 'net/http'
      require 'net/https'
      
      uri = URI.parse(adapter.data_url)
      response = Net::HTTP.get_response(uri)
      JSON.parse response.body

    end

    def get_obj_name(obj)
      (obj.is_a?(Class) ? obj : obj.class).name.parameterize.underscore.to_sym
    end

    def parce adapter, obj
      data = get_data adapter
      data_map = adapter.data_map[get_obj_name(obj)]
      parce_data = []

      dig(data, data_map[:path]).each do |row|
        hash = {}
        data_map[:fields_map].each do |name, field|
          hash[name] = dig(row, field[:path])
          hash[name] = field[:compute].call(row, hash[name]) if field[:compute]
          hash[name] = field[:callback].call(hash[name]) if field[:callback]
          
        end
        parce_data << hash
      end 

      parce_data
    end

    def dig data, path
      path = [path] if path.is_a? String

      data.dig *path
    end


    def get_adapter(partner)
      ADAPTER_NAMES[partner.adapter_name]
    end
  end


end
