# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
#  partner_id :integer
#  reg_number :string(255)
#  status     :integer          default(0), not null
#  fuel_max   :integer
#  fuel       :integer
#  mileage    :integer
#  foreign_id :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Car < ActiveRecord::Base
	validates :name, presence: true
	validates :status, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :partner_id, presence: true
	validates :foreign_id, presence: true, uniqueness: { scope: :partner_id }

	belongs_to :partner

	enum status: [:unknown_status, :active]

end
