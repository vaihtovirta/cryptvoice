class InvoicesController < ApplicationController
  expose(:invoice, attributes: :invoice_params)
  expose(:currencies) { Invoice.currencies.keys.map(&:upcase) }

  def new
  end

  def create
    invoice.save

    respond_with invoice, location: new_invoice_path
  end

  private

  def invoice_params
    params.require(:invoice).permit(:custom_id, :price_cents, :currency)
  end
end
