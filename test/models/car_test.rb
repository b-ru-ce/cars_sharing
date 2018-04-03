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

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
