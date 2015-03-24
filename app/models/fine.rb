class Fine < ActiveRecord::Base
  belongs_to :infraction
  belongs_to :law
end
