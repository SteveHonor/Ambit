class Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment, type: String
  field :parent_id, type: String
  field :level, type: String

  validates :level, presence: true
end
