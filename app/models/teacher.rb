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
    before_create :nombres_upcase
    	
    def self.search(search)
        where("code LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%") 
    end

    def name_convert(my_name)
        my_name = I18n.transliterate(my_name).upcase
        return my_name
    end

    def nombres_upcase
        #coloca en mayus y sin acento 
        self.name = name_convert(self.name)
        self.surnames = name_convert(self.surnames)
    end
end
