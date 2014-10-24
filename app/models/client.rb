class Client < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  #scope :with_current_copay, joins(:insurance_providers).merge(InsuranceProvider.max.group(:client_id))
  
  has_many :appointments
  has_many :insurance_providers
  accepts_nested_attributes_for :insurance_providers
  belongs_to :users

end
