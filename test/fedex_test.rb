require "test_helper"
require 'fedex'
require 'nokogiri'

class FedexTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Fedex::VERSION
  end

  def test_it_does_something_useful
    credentials = {
      key: 'bkjIgUhxdghtLw9L',
      password: '6p8oOccHmDwuJZCyJs44wQ0Iw',
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

    xml = Fedex::Rates.build_xml(credentials, quote_params)

    expected_xml = Nokogiri::XML("<?xml version=\"1.0\"?>
<RateRequest xmlns=\"http://fedex.com/ws/rate/v13\">
  <WebAuthenticationDetail>
    <UserCredential>
      <Key>bkjIgUhxdghtLw9L</Key>
      <Password>6p8oOccHmDwuJZCyJs44wQ0Iw</Password>
    </UserCredential>
  </WebAuthenticationDetail>
  <ClientDetail>
    <AccountNumber>510087720</AccountNumber>
    <MeterNumber>119238439</MeterNumber>
    <Localization>
      <LanguageCode>es</LanguageCode>
      <LocaleCode>mx</LocaleCode>
    </Localization>
  </ClientDetail>
  <Version>
    <ServiceId>crs</ServiceId>
    <Major>13</Major>
    <Intermediate>0</Intermediate>
    <Minor>0</Minor>
  </Version>
  <ReturnTransitAndCommit>true</ReturnTransitAndCommit>
  <RequestedShipment>
    <DropoffType>REGULAR_PICKUP</DropoffType>
    <PackagingType>YOUR_PACKAGING</PackagingType>
    <Shipper>
      <Address>
        <StreetLines/>
        <City/>
        <StateOrProvinceCode>XX</StateOrProvinceCode>
        <PostalCode>64000</PostalCode>
        <CountryCode>MX</CountryCode>
      </Address>
    </Shipper>
    <Recipient>
      <Address>
        <StreetLines/>
        <City/>
        <StateOrProvinceCode>XX</StateOrProvinceCode>
        <PostalCode>64000</PostalCode>
        <CountryCode>MX</CountryCode>
        <Residential>false</Residential>
      </Address>
    </Recipient>
    <ShippingChargesPayment>
      <PaymentType>SENDER</PaymentType>
    </ShippingChargesPayment>
    <RateRequestTypes>ACCOUNT</RateRequestTypes>
    <PackageCount>1</PackageCount>
    <RequestedPackageLineItems>
      <GroupPackageCount>1</GroupPackageCount>
      <Weight>
        <Units>KG</Units>
        <Value>6</Value>
      </Weight>
      <Dimensions>
        <Length>#{quote_params[:parcel][:length].to_i}</Length>
        <Width>28</Width>
        <Height>46</Height>
        <Units>CM</Units>
      </Dimensions>
    </RequestedPackageLineItems>
  </RequestedShipment>
</RateRequest>")


    assert_equal(expected_xml.to_s, xml.to_s)
  end
end
