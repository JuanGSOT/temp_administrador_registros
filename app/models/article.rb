# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  name        :string
#  details     :string
#  description :text
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Article < ApplicationRecord
    before_save :modify_article

    def modify_article
        self.name = self.name.capitalize
        self.details = self.details.upcase
    end
end
