# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
    has_many :comments, as: :commentable , :dependent => :destroy
    
    validates :title, presence: true, length:{ minimum: 5}
end
