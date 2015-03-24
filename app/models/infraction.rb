class Infraction < ActiveRecord::Base
  has_many :fine

  state_machine :state, initial: :pending do
    event :supervised do
      transition pending: :supervised
    end

    event :notified do
      transition supervised: :notified
    end

    event :down do
      transition all => :canceled
    end
  end
end
