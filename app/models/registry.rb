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

    def self.search(teacher_id, page)
        if teacher_id
          where('teacher_id LIKE ?', "%#{teacher_id}%").paginate(page: page, per_page: 10).order('id DESC')
        else
          Registry.paginate(page: page, per_page: 10).order('id DESC')
        end
    end
end
