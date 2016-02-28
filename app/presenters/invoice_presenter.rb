require "delegate"

class InvoicePresenter < SimpleDelegator
  def bitcoin_uri_qr_code
    GenerateQrCode.new(model.bitcoin_uri).call
  end

  def valid_till_time
    model.valid_till.strftime("%Y/%m/%d %H:%M:%S")
  end

  def model
    __getobj__
  end
end
