class Fine < ActiveRecord::Base
  belongs_to :notification
  belongs_to :law
end
