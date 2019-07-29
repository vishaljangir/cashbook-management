class Credit < ApplicationRecord
	belongs_to :cashbook_index, inverse_of: :credits
end
