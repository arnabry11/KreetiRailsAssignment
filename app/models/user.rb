class User < ApplicationRecord
  
  def self.to_csv 
    attributes = %w{name email phone_number}
    CSV.generate do |csv| 
      csv << attributes
      all.each do |user| 
        csv << user.attributes.values_at(*attributes)
      end
    end
  end

end
