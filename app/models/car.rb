# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  name       :string
#  latitude   :float
#  longitude  :float
#  parnter_id :integer
#  gnum       :string
#  status     :integer
#  fuel_max   :integer
#  fuel       :integer
#  mileage    :integer
#  foreign_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Car < ActiveRecord::Base
end
