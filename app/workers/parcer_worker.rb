class ParcerWorker
  include Sidekiq::Worker

  def perform(partner)
  	adapter = ParcingService.get_adapter partner
  	parce_data = ParcingService.parce(adapter, Car)

  	import_list = []
  	parce_data.each do |data|
  		car = Car.new(data)
  		car.partner_id = partner.id
  		import_list << car
  	end	

  	Car.where(partner_id: partner.id).update_all("status = #{Car.statuses[:unknown_status.to_s]}")

  	adapter.prepare_database(partner) if adapter.respond_to?(:prepare_database)

  	Car.import import_list, on_duplicate_key_update: [:latitude, :longitude, :reg_number, :status, :name, :fuel_max, :fuel, :mileage]
  	# TODO need add some log 

  end
end
