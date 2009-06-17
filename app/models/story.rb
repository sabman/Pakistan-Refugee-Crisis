class Story < ActiveRecord::Base
  belongs_to :user
  has_many :donations
  acts_as_commentable
  has_attached_file :photo, :styles => {:small => "150x150>"},
                    :url => "/assets/stories/:id/:style/:basename.:extension", 
                    :path => ":rails_root/public/assets/stories/:id/:style/:basename.:extension"

  # validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
                      
end
