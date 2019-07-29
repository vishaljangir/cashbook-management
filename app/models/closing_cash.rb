class ClosingCash < ApplicationRecord
	belongs_to :cashbook_index, inverse_of: :closing_cashes


end
