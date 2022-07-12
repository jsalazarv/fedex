require 'httparty'
require 'nokogiri'

class DhlService
  include HTTParty
  format :xml
  base_uri 'https://wsbeta.fedex.com:443'

  def self.build_xml(credentials, quote_params)
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.send('p:DCTRequest').('xmlns:p' => 'http://www.dhl.com',
                          'xmlns:p1' => 'http://www.dhl.com/datatypes',
                          'xmlns:p2' => 'http://www.dhl.com/DCTRequestdatatypes',
                          'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
                          'xsi:schemaLocation' => 'http://www.dhl.com DCT-req.xsd'
                          ) {
        xml.parent.remove_attribute('class')
        xml.GetQuote {
          xml.Request {
            xml.ServiceHeader {
              xml.MessageTime '2019-01-31T14:52:00-06:00'
              xml.MessageReference '7563573320563005740683078845'
              xml.SiteID 'DServiceVal'
              xml.Password 'testServVal'
            }
          }
          xml.From {
            xml.CountryCode 'MX'
            xml.Postalcode '15700'
            xml.City 'MEXICO DF'
          }
          xml.BkgDetails {
            xml.PaymentCountryCode 'MX'
            xml.Date '2022-02-08'
            xml.ReadyTime 'PT14H52M'
            xml.DimensionUnit 'CM'
            xml.WeightUnit 'KG'
            xml.NumberOfPieces 1
            xml.Pieces {
              xml.Piece {
                xml.PieceID 1
                xml.Height 1
                xml.Depth 1
                xml.Width 1
                xml.Weight 10.00
              }
            }
            xml.IsDutiable 'N'
            xml.QtdShp {
              xml.GlobalProductCode 'N'
            }
          }
          xml.To {
            xml.CountryCode 'MX'
            xml.Postalcode '40831'
            xml.City 'MEXICO DF'
          }
          xml.Dutiable {
            xml.DeclaredCurrency 'MXN'
            xml.DeclaredValue 0.0
          }
        }
      }
    end
    builder.to_xml
  end

  def self.map_response(data)
    root = data['res:DCTResponse']['GetQuoteResponse']
    qtd_shp_ex_chrg = root['BkgDetails']['QtdShp']['QtdShpExChrg']

    data = []

    qtd_shp_ex_chrg.each { |item|
      price = item['ChargeValue']
      currency_code = item['CurrencyCode']
      service_level_name = item['GlobalServiceName']
      service_level_token = item['LocalServiceTypeName']
      data.push({
                  price: price.to_f,
          currency: currency_code,
          service_level: {
            name: service_level_name,
            token: service_level_token
          }
        })
    }

    return data
  end

  def self.get(credentials, quote_params)
    body = build_xml(credentials, quote_params)
    response = post( "/xml", body: body)
    map_response(response)
  end
end
