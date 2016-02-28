require "rqrcode"

class GenerateQrCode
  attr_reader :bitcoin_uri

  def initialize(bitcoin_uri)
    @bitcoin_uri = bitcoin_uri
  end

  def call
    return if bitcoin_uri.nil?

    svg
  end

  private

  def qr_code
    @qr_code ||= RQRCode::QRCode.new(bitcoin_uri)
  end

  def svg
    @svg ||= qr_code.as_svg(
      offset: 0,
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 5
    )
  end
end
