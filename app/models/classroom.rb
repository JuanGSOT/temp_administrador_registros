# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :boolean          default(FALSE)
#  live       :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Classroom < ApplicationRecord
    validates :name, presence: {message: "No debe dejar el campo de Salon en blanco."}, uniqueness: true
    
    before_create :modify_classroom
    before_save :modify_classroom

    def modify_classroom
        self.name = self.name.upcase
    end

end
