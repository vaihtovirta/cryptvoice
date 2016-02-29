require "rqrcode"

class GenerateQrCode
  attr_reader :bitcoin_uri, :size

  DEFAULT_COLOR = "000".freeze
  DEFAULT_SHAPE_RENDERING_TYPE = "crispEdges".freeze

  def initialize(bitcoin_uri, size = 6)
    @bitcoin_uri = bitcoin_uri
    @size = size
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
      color: DEFAULT_COLOR,
      shape_rendering: DEFAULT_SHAPE_RENDERING_TYPE,
      module_size: size
    )
  end
end
