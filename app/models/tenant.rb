class Tenant < ApplicationRecord
    has_many :tenants
    has_many :apartments

    validates :name, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 18 }

end