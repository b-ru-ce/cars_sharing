require 'rails_helper'
require 'spec_helper'

describe ParcingService do
  context '.parce' do


  	let!(:car5_parnter) { Partner.create( {name: "Car5", adapter_name: "car5"} ) }
  	let!(:delimobil_parnter) { Partner.create( {name: "Delimobil", adapter_name: "delimobil"} ) }
  	let!(:timcar_parnter) { Partner.create( {name: "TimCar", adapter_name: "timcar"} ) }


  	cases = [
  		{
  			link: "https://www.car5.ru/car5/rs/car5.get.list.php?desktop=1",
  			stub: [
								{
									"data":{
										"arrCar":[
											{
												"id":"310",
												"latitude":"55.8248901",
												"longitude":"37.4518089",
												"name":"Volvo",
												"gnum":"\u0425 164 \u0410\u0415 799",
												"status":"1",
												"fuelmax":"45",
												"mileage":"20892",
												"fuel":"43"
											},
											{
												"status":"invalid status",
											}
										]
									}
								}
							],
				expect: {:name=>"Volvo", :latitude=>"55.8248901", :longitude=>"37.4518089", :fuel_max=>"45", :status=>:active, :reg_number=>"Х 164 АЕ 799", :foreign_id=>"310", :fuel=>"43", :mileage=>"20892"},
				partner: Partner.create( {name: "Car5", adapter_name: "car5"} )

  		},
  		{
  			link: "https://delimobil.ru/maps-data?action=cars&alias=ru",
  			stub: {
  				"type":"FeatureCollection",
  				"features":[
  					{
  						"type":"Feature",
  						"id":298,
  						"model":"Hyundai Solaris",
  						"reg_number":"\u041e550\u041e\u0425777",
  						"fuel":"27.62",
  						"status":"available",
  						"geometry":{
  							"type":"Point",
  							"coordinates":[37.8363647,55.6501808]
  						}
  					},
  					{
							"status":"invalid status",
						}
  				]
  			},
				expect: {:name=>"Hyundai Solaris", :latitude=>55.6501808, :longitude=>37.8363647, :status=>:active, :reg_number=>"О550ОХ777", :foreign_id=>298, :fuel=>"27.62"},
				partner: Partner.create( { name: "Delimobil", adapter_name: "delimobil" } )

  		},
  		{
  			link: "https://service.timcar.ru/api/cars",
  			stub: {
  				"cars":[
  					{
  						"Id":"2f74e1be-fea5-4f9c-a4f6-f80ae0002df8",
  						"Brand":"Renault",
  						"Color":"Белый",
  						"Model":"Logan",
  						"ModelImageId":"78547bea-c82d-4d17-9ebe-a848009f78f0",
  						"Lat":55.5427246,
  						"Lon":37.5206261
  					}
  				]
  			},
  			expect: {:name=>"Renault Logan", :latitude=>55.5427246, :longitude=>37.5206261, :status=>:active, :foreign_id=>"2f74e1be-fea5-4f9c-a4f6-f80ae0002df8"},
				partner: Partner.create( {name: "TimCar", adapter_name: "timcar"} ),
				without_check_status: true
  		}
  	]

  	cases.each do |data|
      it "should correct parse data from #{data[:partner].name}" do
    	
	    	stub_request(:get, data[:link]).to_return(
		  		:status => 200, 
		  		:body => data[:stub].to_json,
					:headers => {})

	    	expect_return = {:name=>"Volvo", :latitude=>"55.8248901", :longitude=>"37.4518089", :fuel_max=>"45", :status=>:active, :reg_number=>"Х 164 АЕ 799", :foreign_id=>"310", :fuel=>"43", :mileage=>"20892"}

				adapter = ParcingService.get_adapter data[:partner]
	      res = ParcingService.parce(adapter, Car)

	      expect(res[0]).to eq(data[:expect])
	      expect(res[1][:status]).to eq(:unknown_status) unless data[:without_check_status]
	    end
    end


  end
end