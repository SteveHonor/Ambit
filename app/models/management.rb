class Management < ActiveRecord::Base
  has_many :users

  mount_uploader :avatar, AvatarUploader
end
