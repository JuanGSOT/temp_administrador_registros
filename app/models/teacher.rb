# == Schema Information
#
# Table name: teachers
#
#  id            :integer          not null, primary key
#  department_id :integer
#  code          :integer
#  name          :string
#  surnames      :string
#  contract      :boolean
#  status        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Teacher < ApplicationRecord
    belongs_to :department

    validates :code, uniqueness: { message: "Recuerde el código de profesor es unico!"}
    	
    def self.search(search)
        where("code LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%") 
    end
end
