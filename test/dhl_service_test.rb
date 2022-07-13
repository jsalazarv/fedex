require 'minitest/autorun'
require 'nokogiri'
require 'fedex/dhl_service'
require 'factories/dhl_response_factory'
require 'set'


class DhlServiceTest < Minitest::Test
  def test_build_the_expected_dhl_xml_body
    credentials = {
      key: 'DServiceVal',
      password: 'testServVal'
    }
    quote_params = {
      address_from: {
        zip: "64000",
        country: "MX"
      },
      address_to: {
        zip: "64000",
        country: "MX"
      },
      parcel: {
        length: 25.0,
        width: 28.0,
        height: 46.0,
        distance_unit: "CM",
        weight: 6.5,
        mass_unit: "KG"
      }
    }

    date = Time.new
    date_format = date.strftime("%Y-%m-%d")


    xml = DhlService.build_xml(credentials, quote_params)

    expected_xml = Nokogiri::XML("<?xml version=\"1.0\"?>
<p:DCTRequest xmlns:p=\"http://www.dhl.com\"
      xmlns:p1=\"http://www.dhl.com/datatypes\" xmlns:p2=\"http://www.dhl.com/DCTRequestdatatypes\"
      xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.dhl.com
DCT-req.xsd\">
  <GetQuote>
    <Request>
      <ServiceHeader>
        <MessageReference>7563573320563005740683078845</MessageReference>
        <SiteID>#{credentials[:key]}</SiteID>
        <Password>#{credentials[:password]}</Password>
      </ServiceHeader>
    </Request>
    <From>
      <CountryCode>#{quote_params[:address_from][:country]}</CountryCode>
      <Postalcode>#{quote_params[:address_from][:zip]}</Postalcode>
    </From>
    <BkgDetails>
      <PaymentCountryCode>#{quote_params[:address_from][:country]}</PaymentCountryCode>
      <Date>#{date_format}</Date>
      <ReadyTime>PT14H52M</ReadyTime>
      <DimensionUnit>#{quote_params[:parcel][:distance_unit]}</DimensionUnit>
      <WeightUnit>#{quote_params[:parcel][:mass_unit]}</WeightUnit>
      <NumberOfPieces>1</NumberOfPieces>
      <Pieces>
        <Piece>
          <PieceID>1</PieceID>
          <Height>#{quote_params[:parcel][:height]}</Height>
          <Depth>#{quote_params[:parcel][:length]}</Depth>
          <Width>#{quote_params[:parcel][:width]}</Width>
          <Weight>#{quote_params[:parcel][:weight]}</Weight>
        </Piece>
      </Pieces>
    </BkgDetails>
    <To>
      <CountryCode>#{quote_params[:address_to][:country]}</CountryCode>
      <Postalcode>#{quote_params[:address_to][:zip]}</Postalcode>
    </To>
  </GetQuote>
</p:DCTRequest>
")
    assert_equal(expected_xml.to_s, xml.to_s)
  end

  def test_map_response
    response = DhlService::map_response(DhlResponseFactory.createResponse())

    assert_equal(4, response.length)

    expected_response = [
      {
        price: 157.55,
        currency: "MXN",
        service_level: {
          name: "REMOTE AREA DELIVERY",
          token: "REMOTE AREA DELIVERY"
        }
      },
      {
        price: 111.31,
        currency: "MXN",
        service_level: {
          name: "FUEL SURCHARGE",
          token: "FUEL SURCHARGE"
        }
      },
      {
        price: 157.55,
        currency: "MXN",
        service_level: {
          name: "REMOTE AREA DELIVERY",
          token: "REMOTE AREA DELIVERY"
        }
      },
      {
        price: 23.48,
        currency: "MXN",
        service_level:
          {
            name: "FUEL SURCHARGE",
            token: "FUEL SURCHARGE"
          }
      }
    ]

    assert_equal(expected_response, response)
  end

  def test_get

  end
end
