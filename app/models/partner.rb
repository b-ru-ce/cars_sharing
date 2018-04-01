# == Schema Information
#
# Table name: partners
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  adapter_name :string(255)
#

class Partner < ActiveRecord::Base
	validates :name, presence: true
	validates :adapter_name, presence: true
end
