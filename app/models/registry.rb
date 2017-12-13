# == Schema Information
#
# Table name: registries
#
#  id           :integer          not null, primary key
#  article_id   :integer
#  user_id      :integer
#  teacher_id   :integer
#  classroom_id :integer
#  status       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Registry < ApplicationRecord
  belongs_to :article, required: true
  belongs_to :teacher, required: true
  belongs_to :classroom, required: true
  validates :teacher_id, :article_id, :classroom_id, presence: true
  
  scope :option, -> (option) {
    where(:created_at => Registry.filtro(option), :status => false).paginate(page: 1, per_page: 10).order('id DESC')
  }
  
  scope :filtro_maestro, -> (beginning_date, end_date) {
    where(:created_at => Time.parse(beginning_date)..Time.parse(end_date), :status => false).paginate(page: 1, per_page: 10).order('id DESC')
  }
  
  def self.search(teacher_id, page, option = nil)
    if !option.nil?
      where(:created_at => option, :status => false, :teacher_id => teacher_id.to_i).paginate(page: page, per_page: 10).order('id DESC')
    elsif teacher_id
      where(:teacher_id => Teacher.where("cast(code as text) like ?", "%#{teacher_id}%").ids).paginate(page: page, per_page: 10).order('id DESC')
    else
      Registry.paginate(page: page, per_page: 10).order('id DESC')
    end
  end

  def self.filtro(option)
    option = option.to_i
    if option == 1
      time = Date.today.beginning_of_week..Date.today.end_of_week
    elsif option == 2
      time = Date.today.beginning_of_month..Date.today.end_of_month
    elsif option == 3
      
      if Date.today.month > 6
        time = Date.new(Time.now.year, 7, 1)..Date.new(Time.now.year, 12, -1)
      else
        time = Date.new(Time.now.year, 1, 1)..Date.new(Time.now.year, 6, -1)
      end        
      
    elsif option == 4
      time = Date.today.beginning_of_year..Date.today.end_of_year
    end  
    return time
  end
  
end
