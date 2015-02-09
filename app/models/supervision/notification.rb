module Supervision
  class Notification < ActiveRecord::Base
    state_machine :state, initial: :notified do
      event :supervised do
        transition notified: :supervised
      end
    end
  end
end
