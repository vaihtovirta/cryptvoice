class InvoicesController < ApplicationController
  expose(:invoice, attributes: :invoice_params)
  expose(:currencies) { Invoice.currencies.values }

  before_action :check_qr_code_validity!, only: %i(show)

  def new
  end

  def show
    self.invoice = InvoicePresenter.new(invoice)
  end

  def create
    ProcessInvoice.call(invoice: invoice, params: invoice_params) if invoice.valid?

    respond_with invoice
  end

  private

  def invoice_params
    params.require(:invoice).permit(:custom_id, :price_cents, :currency)
  end

  def check_qr_code_validity!
    redirect_to root_path if invoice.valid_till < Time.zone.now
  end
end
