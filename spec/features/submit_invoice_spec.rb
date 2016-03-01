require "rails_helper"

feature "Submit Invoice", js: true do
  let(:attributes) { attributes_for(:invoice) }
  let(:create_invoice_api) { double("context", invoice_attributes: attributes) }

  background do
    visit new_invoice_path
  end

  context "given valid params" do
    background do
      allow(CreateInvoiceApi).to receive(:call).and_return(create_invoice_api)
    end

    scenario "successfull submit" do
      within ".invoice-form" do
        fill_in "Custom Id", with: attributes[:custom_id]
        fill_in "Price", with: attributes[:price].amount
        select attributes[:currency], from: "invoice[currency]"
        click_button("Create Invoice")
      end

      expect(page.text).to match("Valid for:")
      expect(page).to have_css(".qr-code svg")
    end
  end

  context "given wrong params" do
    scenario "show error messages" do
      within ".invoice-form" do
        fill_in "Custom Id", with: attributes[:custom_id]
        fill_in "Price", with: "0.0"
        select attributes[:currency], from: "invoice[currency]"
        click_button("Create Invoice")
      end

      expect(page).to have_text("New Invoice")
      expect(page).to have_css(".errors")
    end
  end
end
