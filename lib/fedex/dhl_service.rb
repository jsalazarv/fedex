require 'httparty'
require 'nokogiri'

class DhlService
  include HTTParty
  format :xml
  base_uri 'https://xmlpitest-ea.dhl.com'

  def self.build_xml(credentials, quote_params)
    date = Time.new
    date_format = date.strftime("%Y-%m-%d")

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
              xml.MessageReference '7563573320563005740683078845'
              xml.SiteID credentials[:key]
              xml.Password credentials[:password]
            }
          }
          xml.From {
            xml.CountryCode quote_params[:address_from][:country]
            xml.Postalcode quote_params[:address_from][:zip]
            #xml.City 'MEXICO DF' TODO: Add support for city
          }
          xml.BkgDetails {
            xml.PaymentCountryCode quote_params[:address_from][:country]
            xml.Date date_format
            xml.ReadyTime 'PT14H52M'
            xml.DimensionUnit quote_params[:parcel][:distance_unit]
            xml.WeightUnit quote_params[:parcel][:mass_unit]
            xml.NumberOfPieces 1
            xml.Pieces {
              xml.Piece {
                xml.PieceID 1
                xml.Height quote_params[:parcel][:height]
                xml.Depth quote_params[:parcel][:length]
                xml.Width quote_params[:parcel][:width]
                xml.Weight quote_params[:parcel][:weight]
              }
            }
          }
          xml.To {
            xml.CountryCode quote_params[:address_to][:country]
            xml.Postalcode quote_params[:address_to][:zip]
            #xml.City 'MEXICO DF' TODO: Add support for city
          }
        }
      }
    end
    builder.to_xml
  end

  def self.map_response(data)
    root = data['DCTResponse']['GetQuoteResponse']
    qtd_shp = root['BkgDetails']['QtdShp']
    data = []

    begin
      qtd_shp.each { |shp|
        ex_chrg = shp['QtdShpExChrg']
        qtd_shp_ex_chrg = ex_chrg.kind_of?(Array) ? ex_chrg : [ex_chrg]
        qtd_shp_ex_chrg.each { |item|
          if item
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
          end
        }
      }
    rescue
      return data
    ensure
      return data
    end
  end

  def self.get(credentials, quote_params)
    body = build_xml(credentials, quote_params)
    response = post( "/XMLShippingServlet", body: body)
    map_response(response)
  end
end
