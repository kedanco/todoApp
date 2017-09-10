class Tasklist < ApplicationRecord
    validates :name, presence: true

    has_many :tasks
end
