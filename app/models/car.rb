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
	validates :name, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :parnter_id, presence: true
	validates :foreign_id, presence: true, uniqueness: { scope: :parnter_id }


end
