class Infraction < ActiveRecord::Base
  has_many :fine
  has_many :supervision

  belongs_to :users

  state_machine :state, initial: :pending do
    event :archived do
      transition pending: :archived
    end

    event :supervised do
      transition pending: :supervised
    end

    event :notified do
      transition supervised: :notified
    end

    event :down do
      transition all => :canceled
    end

    event :fined do
      transition notified: :fined
    end
  end
end
