class InvoicesController < ApplicationController
  expose(:invoice, attributes: :invoice_params)
  expose(:currencies) { Invoice.currencies.keys }

  def new
  end

  def create
    result = ProcessInvoice.call(params: invoice_params)

    respond_with invoice, location: new_invoice_path
  end

  private

  def invoice_params
    params.require(:invoice).permit(:custom_id, :price_cents, :currency)
  end
end
