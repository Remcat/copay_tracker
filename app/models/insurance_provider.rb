class InsuranceProvider < ActiveRecord::Base
  #scope :max, -> maximum(:effective_on, :group => 'client_id') 
  belongs_to :client
end
 