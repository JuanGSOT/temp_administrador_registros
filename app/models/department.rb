# == Schema Information
#
# Table name: departments
#
#  id                :integer          not null, primary key
#  name              :string
#  apartment_manager :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Department < ApplicationRecord
    has_many :teachers
end
