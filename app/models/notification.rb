class Notification < ActiveRecord::Base
  has_many :fine

  state_machine :state, initial: :pending do
    event :supervised do
      transition pending: :supervised
    end
  end
end
