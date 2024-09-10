class Account < ApplicationRecord
  belongs_to :user
  has_many :deposits
  has_many :withdrawals

  def balance
    debits = self.withdrawals.sum(:amount)
    credits = self.deposits.sum(:amount)

    (credits - debits).to_f
  end
end
