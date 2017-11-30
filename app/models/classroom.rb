# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Classroom < ApplicationRecord
    validates :name, presence: {message: "No debe dejar el campo de Salon en blanco."}, uniqueness: {message: "Intente de nuevo, los datos ingresados ya existen."}
end
