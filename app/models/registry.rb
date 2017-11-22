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
    belongs_to :article
    belongs_to :teacher
    belongs_to :classroom
end
