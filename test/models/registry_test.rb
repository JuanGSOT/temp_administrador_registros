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

require 'test_helper'

class RegistryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
