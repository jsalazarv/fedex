# frozen_string_literal: true

require_relative 'fedex/version'
require 'httparty'
require 'nokogiri'

module Fedex
  class Error < StandardError; end

  # Your code goes here...
  class Rates
    include HTTParty
    format :xml
    base_uri 'https://wsbeta.fedex.com:443'

    def self.build_xml(credentials, quote_params)
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.RateRequest('xmlns' => 'http://fedex.com/ws/rate/v13') do
          xml.WebAuthenticationDetail {
            xml.UserCredential {
              xml.Key credentials[:key]
              xml.Password credentials[:password]
            }
          }
          xml.ClientDetail {
            xml.AccountNumber 510087720
            xml.MeterNumber 119238439
            xml.Localization {
              xml.LanguageCode 'es'
              xml.LocaleCode 'mx'
            }
          }
          xml.Version {
            xml.ServiceId 'crs'
            xml.Major 13
            xml.Intermediate 0
            xml.Minor 0
          }
          xml.ReturnTransitAndCommit true
          xml.RequestedShipment {
            xml.DropoffType 'REGULAR_PICKUP'
            xml.PackagingType 'YOUR_PACKAGING'
            xml.Shipper {
              xml.Address {
                xml.StreetLines ''
                xml.City ''
                xml.StateOrProvinceCode 'XX'
                xml.PostalCode quote_params[:address_from][:zip]
                xml.CountryCode quote_params[:address_from][:country]
              }
            }
            xml.Recipient {
              xml.Address {
                xml.StreetLines ''
                xml.City ''
                xml.StateOrProvinceCode 'XX'
                xml.PostalCode quote_params[:address_to][:zip]
                xml.CountryCode quote_params[:address_to][:country]
                xml.Residential false
              }
            }
            xml.ShippingChargesPayment {
              xml.PaymentType 'SENDER'
            }
            xml.RateRequestTypes 'ACCOUNT'
            xml.PackageCount 1
            xml.RequestedPackageLineItems {
              xml.GroupPackageCount 1
              xml.Weight {
                xml.Units quote_params[:parcel][:mass_unit]
                xml.Value quote_params[:parcel][:weight].to_i
              }
              xml.Dimensions {
                xml.Length quote_params[:parcel][:length].to_i
                xml.Width quote_params[:parcel][:width].to_i
                xml.Height quote_params[:parcel][:height].to_i
                xml.Units quote_params[:parcel][:distance_unit]
              }
            }
          }
        end
      end
      builder.to_xml
    end
    
    def self.map_response(data)
      severity = data['RateReply']['HighestSeverity']
      code = data['RateReply']['Code']
      print data
      {
        # TODO: Map data
      }
    end

    def self.get(credentials, quote_params)
      body = build_xml(credentials, quote_params)
      response = post( "/xml", body: body)
      map_response(response)
    end
  end
end
