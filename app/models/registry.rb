# == Schema Information
#
# Table name: registries
#
#  id           :integer          not null, primary key
#  article_id   :integer
#  loan         :datetime
#  return       :datetime
#  user_id      :integer
#  teacher_id   :integer
#  classroom_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Registry < ApplicationRecord
    belongs_to :article, required: true
    belongs_to :teacher, required: true
    belongs_to :classroom, required: true

end
