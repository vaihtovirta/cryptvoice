module StatusAasm
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :status, enum: true do
      state :pending, initial: true
      state :paid
      state :confirmed
      state :partpaid
      state :overpaid
      state :timeout

      event :pay do
        transitions from: :pending, to: :paid
      end

      event :overpay do
        transitions from: %i(pending partpaid), to: :overpaid
      end

      event :partpay do
        transitions from: :pending, to: :partpaid
      end

      event :confirm do
        transitions from: :paid, to: :confirmed
      end

      event :expire do
        transitions from: %i(pending paid partpaid overpaid), to: :timeout
      end

      event :requote do
        transitions from: :timeout, to: :pending
      end
    end
  end
end
