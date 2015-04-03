require 'rails_helper'

RSpec.describe CreditCardChargesController, type: :controller do
  let!(:customer1) { Customer.create(first_name: "Johny", last_name: "Flow") }
  let!(:customer2) { Customer.create(first_name: "Raj", last_name: "Jamnis") }
  let!(:customer3) { Customer.create(first_name: "Andrew", last_name: "Chung") }
  let!(:customer4) { Customer.create(first_name: "Mike", last_name: "Smith") }

  let!(:charge1) { CreditCardCharge.create(paid: true, customer_id: 1, disputed: false) }
  let!(:charge2) { CreditCardCharge.create(paid: true, customer_id: 1, disputed: false) }
  let!(:charge3) { CreditCardCharge.create(paid: true, customer_id: 1, disputed: false) }
  let!(:charge4) { CreditCardCharge.create(paid: true, customer_id: 1, disputed: false) }
  let!(:charge5) { CreditCardCharge.create(paid: true, customer_id: 1, disputed: false) }
  let!(:charge6) { CreditCardCharge.create(paid: true, customer_id: 2, disputed: false) }
  let!(:charge7) { CreditCardCharge.create(paid: true, customer_id: 2, disputed: false) }
  let!(:charge8) { CreditCardCharge.create(paid: true, customer_id: 2, disputed: false) }
  let!(:charge9) { CreditCardCharge.create(paid: true, customer_id: 3, disputed: false) }
  let!(:charge10) { CreditCardCharge.create(paid: true, customer_id: 4, disputed: false) }
  let!(:charge11) { CreditCardCharge.create(paid: false, customer_id: 3, disputed: false) }
  let!(:charge12) { CreditCardCharge.create(paid: false, customer_id: 3, disputed: false) }
  let!(:charge13) { CreditCardCharge.create(paid: false, customer_id: 3, disputed: false) }
  let!(:charge14) { CreditCardCharge.create(paid: false, customer_id: 4, disputed: false) }
  let!(:charge15) { CreditCardCharge.create(paid: false, customer_id: 4, disputed: false) }
  let!(:charge16) { CreditCardCharge.create(paid: true, customer_id: 1, disputed: true) }
  let!(:charge17) { CreditCardCharge.create(paid: true, customer_id: 1, disputed: true) }
  let!(:charge18) { CreditCardCharge.create(paid: true, customer_id: 1, disputed: true) }
  let!(:charge19) { CreditCardCharge.create(paid: true, customer_id: 2, disputed: true) }
  let!(:charge20) { CreditCardCharge.create(paid: true, customer_id: 2, disputed: true) }
  render_views

  describe "GET index" do
    it "contains Successful Charges list" do
      get :index
      expect(response.body).to match /Successful Charges/m
    end
    it "contains Failed Charges list" do
      get :index
      expect(response.body).to match /Failed Charges/m
    end
    it "contains Disputed Charges list" do
      get :index
      expect(response.body).to match /Disputed Charges/m
    end
  end

  describe 'successful scope' do
    it "returns successful charges" do
      expect(CreditCardCharge.successful.size).to eq(10)
    end
  end
  describe 'failed scope' do
    it "returns failed charges" do
      expect(CreditCardCharge.failed.size).to eq(5)
    end
  end
  describe 'disputed scope' do
    it "returns disputed charges" do
      expect(CreditCardCharge.disputed.size).to eq(5)
    end
  end
end
