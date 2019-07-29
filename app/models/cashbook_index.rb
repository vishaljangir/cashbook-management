class CashbookIndex < ApplicationRecord
	attr_accessor :credit_attributes, :debit_attributes
	before_save :reject_action
	belongs_to :user

	

	has_many :credits, inverse_of: :cashbook_index
	has_many :debits, inverse_of: :cashbook_index
	has_many :closing_cashes, inverse_of: :cashbook_index

	accepts_nested_attributes_for :credits, :debits, :closing_cashes

	validates_associated :credits, :debits, :closing_cashes



	
#   def next
#    	CashbookIndex.where("id > ?", id).order("id ASC").first || CashbookIndex.first
# 	end

  	def previous
    	# CashbookIndex.where("id < ?", id).order("id DESC").first || CashbookIndex.last
    	CashbookIndex.where("id < ?", id).order("id DESC").first || CashbookIndex.last

  	end

  	def reject_action
		credits.each do |credit|
			credit.destroy if credit.particular_name.blank?
		end
		debits.each do |debit|
			debit.destroy if debit.particular_name.blank?
		end
  	end
end
