# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'date'
require 'action_view'

class Cat < ApplicationRecord
    CAT_COLORS = %w(black white orange gray)

    validates :birth_date, :color, :name, :sex, presence: true 
    validates :color, inclusion: {in: CAT_COLORS, message: 'must be a valid color'}
    validates :sex, inclusion: {in: %w(M F), message: 'Must be "M" or "F"'}


    def age
        today = Date.today

        total_today_months = (today.year * 12) + today.month
        total_birth_months =  (birth_date.year * 12) + birth_date.month 

        difference = total_today_months - total_birth_months 
        
        years = difference / 12 
        months = difference % 12 

        if years < 1 
            return "#{months} months old" 
        else
            return "#{years} years old" 
        end 
    end

end
