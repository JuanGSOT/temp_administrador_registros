# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  code       :integer
#  name       :string
#  surnames   :string
#  contract   :boolean
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
