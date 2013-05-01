class Post < ActiveRecord::Base
  acts_as_taggable
  attr_accessible :content, :title, :tag_list
  validates :title, :presence => true,
                    :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy
end
