class Transaction < ApplicationRecord
  belongs_to :deposit, foreign_key: "deposit_id", optional: true
  belongs_to :withdrawal, foreign_key: "withdrawal_id", optional: true
  belongs_to :source_account, class_name: "Account", foreign_key: "source_account_id", optional: true
  belongs_to :destination_account, class_name: "Account", foreign_key: "destination_account_id", optional: true

  class << self
    def mutations(account_id)
      self.where(source_account: account_id).
        or(self.where(destination_account: account_id)).
        and(self.where(state: Constants::TransactionState::SUCCEEDED)).order(created_at: "DESC")
    end
  end
end
