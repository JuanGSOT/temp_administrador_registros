# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  name        :string
#  details     :string
#  description :text
#  service     :integer          default(0)
#  maintenance :datetime
#  status      :boolean          default(FALSE)
#  live        :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Article < ApplicationRecord
    before_save :modify_article
    validates :name, :details, presence: true
    def modify_article
        self.name = self.name.capitalize
        self.details = self.details.upcase
    end
end
