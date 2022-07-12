require 'minitest/autorun'
require 'nokogiri'
require 'fedex/dhl_service'
require 'factories/dhl_response_factory'

class DhlServiceTest < Minitest::Test
  def test_build_the_expected_dhl_xml_body
    credentials = {}
    quote_params = {}
    xml = DhlService.build_xml(credentials, quote_params)

    expected_xml = Nokogiri::XML("<?xml version=\"1.0\"?>
<p:DCTRequest xmlns:p=\"http://www.dhl.com\"
      xmlns:p1=\"http://www.dhl.com/datatypes\" xmlns:p2=\"http://www.dhl.com/DCTRequestdatatypes\"
      xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.dhl.com
DCT-req.xsd\">
  <GetQuote>
    <Request>
      <ServiceHeader>
        <MessageTime>2019-01-31T14:52:00-06:00</MessageTime>
        <MessageReference>7563573320563005740683078845</MessageReference>
        <SiteID>DServiceVal</SiteID>
        <Password>testServVal</Password>
      </ServiceHeader>
    </Request>
    <From>
      <CountryCode>MX</CountryCode>
      <Postalcode>15700</Postalcode>
      <City>MEXICO DF</City>
    </From>
    <BkgDetails>
      <PaymentCountryCode>MX</PaymentCountryCode>
      <Date>2022-02-08</Date>
      <ReadyTime>PT14H52M</ReadyTime>
      <DimensionUnit>CM</DimensionUnit>
      <WeightUnit>KG</WeightUnit>
      <NumberOfPieces>1</NumberOfPieces>
      <Pieces>
        <Piece>
          <PieceID>1</PieceID>
          <Height>1</Height>
          <Depth>1</Depth>
          <Width>1</Width>
          <Weight>10.0</Weight>
        </Piece>
      </Pieces>
      <IsDutiable>N</IsDutiable>
      <QtdShp>
        <GlobalProductCode>N</GlobalProductCode>
      </QtdShp>
    </BkgDetails>
    <To>
      <CountryCode>MX</CountryCode>
      <Postalcode>40831</Postalcode>
      <City>MEXICO DF</City>
    </To>
    <Dutiable>
      <DeclaredCurrency>MXN</DeclaredCurrency>
      <DeclaredValue>0.0</DeclaredValue>
    </Dutiable>
  </GetQuote>
</p:DCTRequest>
")

    print expected_xml
    assert_equal(expected_xml.to_s, xml.to_s)
  end

  def test_map_response
    response = DhlService::map_response(DhlResponseFactory.createResponse())
    assert_equal(response, [
      {
        "price": 218.05,
        "currency": "mxn",
        "service_level": {
          "name": "Standard Overnight",
          "token": "STANDARD_OVERNIGHT"
        }
      },
      {
        "price": 139.08,
        "currency": "MXM",
        "service_level": {
          "name": "Fedex Express Saver",
          "token": "FEDEX_EXPRESS_SAVER"
        }
      }
    ])
  end
end
