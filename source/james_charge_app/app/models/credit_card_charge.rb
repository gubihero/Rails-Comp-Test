class CreditCardCharge < ActiveRecord::Base
  scope :successful, -> { where(paid: true, disputed: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(disputed: true) }

  def getCustomerName
    customer = Customer.find(self.customer_id)
    return customer.first_name + " " + customer.last_name
  end
end
