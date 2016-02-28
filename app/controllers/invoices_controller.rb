class InvoicesController < ApplicationController
  expose(:invoice, attributes: :invoice_params)
  expose(:currencies) { Invoice.currencies }
  expose(:qr_code) { GenerateQrCode.new(invoice.bitcoin_uri).call }

  def new
  end

  def show
  end

  def create
    result = ProcessInvoice.call(params: invoice_params) if invoice.valid?

    respond_with result.invoice
  end

  private

  def invoice_params
    params.require(:invoice).permit(:uuid, :custom_id, :price_cents, :currency)
  end
end
