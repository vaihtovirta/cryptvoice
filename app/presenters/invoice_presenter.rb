require "delegate"

class InvoicePresenter < SimpleDelegator
  def bitcoin_uri_qr_code
    GenerateQrCode.new(model.bitcoin_uri).call
  end

  def valid_till_time
    model.valid_till.strftime("%Y/%m/%d %H:%M:%S")
  end

  def bitcoin_price
    "BTC price: #{model.btc_price} BTC"
  end

  def bitcoin_address
    "BTC Address: #{model.btc_address}"
  end

  def model
    __getobj__
  end
end
