# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commenter        :string
#  body             :text
#  commentable_type :string
#  commentable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
end
