class Debit < ApplicationRecord
	belongs_to :cashbook_index, inverse_of: :debits
end
