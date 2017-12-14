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
#  status        :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Teacher < ApplicationRecord
    belongs_to :department

    validates :code, uniqueness: { message: "Recuerde el código de profesor es unico!"}
    validates :code, :name, :surnames, :department_id, presence: { message: "No puede dejar campos en blanco!"}
    before_create :nombres_upcase
    before_update :check_contract

    def self.search(search)
        where("cast(code as text) LIKE ? OR lower(name) LIKE lower(?) OR lower(surnames) LIKE lower(?)", "%#{search}%", "%#{search}%", "%#{search}%") 
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

    def check_contract
        if self.contract.blank? or self.contract.nil?
            self.contract = false
        else
            self.contract = true
        end
    end
end
