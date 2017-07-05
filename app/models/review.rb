class Review < ApplicationRecord
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
  validates :course, presence: true
  validates :year, presence: true
  validates :semester, presence: true
  validates :professor, presence: true
  
  #CHOOSING FIELDS I WANT THE SEARCH FORM TO QUERY 
def self.search(search)
  where("semester LIKE ? OR course LIKE ? OR professor LIKE ? OR year LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end
  
end
