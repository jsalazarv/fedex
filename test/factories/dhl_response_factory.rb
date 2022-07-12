require 'nokogiri'
require 'nori'

class DhlResponseFactory
  def self.createResponse
    xml = Nokogiri::XML("
<res:DCTResponse xmlns:res='http://www.dhl.com' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:schemaLocation= 'http://www.dhl.com DCT-Response.xsd'>
    <GetQuoteResponse>
        <Response>
            <ServiceHeader>
                <MessageTime>2022-07-12T04:57:19.361+00:00</MessageTime>
                <MessageReference>7563573320563005740683078845</MessageReference>
                <SiteID>DServiceVal</SiteID>
            </ServiceHeader>
        </Response>
        <BkgDetails>
            <OriginServiceArea>
                <FacilityCode>HMX</FacilityCode>
                <ServiceAreaCode>MEX</ServiceAreaCode>
            </OriginServiceArea>
            <DestinationServiceArea>
                <FacilityCode>ZIH</FacilityCode>
                <ServiceAreaCode>ZIH</ServiceAreaCode>
            </DestinationServiceArea>
            <QtdShp>
                <GlobalProductCode>N</GlobalProductCode>
                <LocalProductCode>N</LocalProductCode>
                <ProductShortName>EXPRESS DOMESTIC</ProductShortName>
                <LocalProductName>EXPRESS DOMESTIC</LocalProductName>
                <NetworkTypeCode>TD</NetworkTypeCode>
                <POfferedCustAgreement>N</POfferedCustAgreement>
                <TransInd>Y</TransInd>
                <PickupDate>2022-02-08</PickupDate>
                <PickupCutoffTime>PT18H15M</PickupCutoffTime>
                <BookingTime>PT15H15M</BookingTime>
                <CurrencyCode>MXN</CurrencyCode>
                <ExchangeRate>0.043070</ExchangeRate>
                <WeightCharge>589.560</WeightCharge>
                <WeightChargeTax>81.320</WeightChargeTax>
                <TotalTransitDays>1</TotalTransitDays>
                <PickupPostalLocAddDays>0</PickupPostalLocAddDays>
                <DeliveryPostalLocAddDays>7</DeliveryPostalLocAddDays>
                <PickupNonDHLCourierCode> </PickupNonDHLCourierCode>
                <DeliveryNonDHLCourierCode> </DeliveryNonDHLCourierCode>
                <DeliveryDate>2022-02-16</DeliveryDate>
                <DeliveryTime>PT23H59M</DeliveryTime>
                <DimensionalWeight>10.000</DimensionalWeight>
                <WeightUnit>KG</WeightUnit>
                <PickupDayOfWeekNum>2</PickupDayOfWeekNum>
                <DestinationDayOfWeekNum>3</DestinationDayOfWeekNum>
                <QtdShpExChrg>
                    <SpecialServiceType>OO</SpecialServiceType>
                    <LocalServiceType>OO</LocalServiceType>
                    <GlobalServiceName>REMOTE AREA DELIVERY</GlobalServiceName>
                    <LocalServiceTypeName>REMOTE AREA DELIVERY</LocalServiceTypeName>
                    <SOfferedCustAgreement>N</SOfferedCustAgreement>
                    <ChargeCodeType>SCH</ChargeCodeType>
                    <CurrencyCode>MXN</CurrencyCode>
                    <ChargeValue>157.550</ChargeValue>
                    <ChargeTaxAmount>21.730</ChargeTaxAmount>
                    <ChargeTaxAmountDet>
                        <TaxTypeRate>16.000</TaxTypeRate>
                        <TaxTypeCode>IVA   </TaxTypeCode>
                        <TaxAmount>21.730</TaxAmount>
                        <BaseAmount>135.820</BaseAmount>
                    </ChargeTaxAmountDet>
                    <QtdSExtrChrgInAdCur>
                        <ChargeValue>157.550</ChargeValue>
                        <ChargeTaxAmount>21.730</ChargeTaxAmount>
                        <CurrencyCode>MXN</CurrencyCode>
                        <CurrencyRoleTypeCode>BILLC</CurrencyRoleTypeCode>
                        <ChargeTaxAmountDet>
                            <TaxTypeRate>16.000</TaxTypeRate>
                            <TaxTypeCode>IVA   </TaxTypeCode>
                            <TaxAmount>21.730</TaxAmount>
                            <BaseAmount>135.820</BaseAmount>
                        </ChargeTaxAmountDet>
                    </QtdSExtrChrgInAdCur>
                    <QtdSExtrChrgInAdCur>
                        <ChargeValue>157.550</ChargeValue>
                        <ChargeTaxAmount>21.730</ChargeTaxAmount>
                        <CurrencyCode>MXN</CurrencyCode>
                        <CurrencyRoleTypeCode>PULCL</CurrencyRoleTypeCode>
                        <ChargeTaxAmountDet>
                            <TaxTypeRate>16.000</TaxTypeRate>
                            <TaxTypeCode>IVA   </TaxTypeCode>
                            <TaxAmount>21.730</TaxAmount>
                            <BaseAmount>135.820</BaseAmount>
                        </ChargeTaxAmountDet>
                    </QtdSExtrChrgInAdCur>
                    <QtdSExtrChrgInAdCur>
                        <ChargeValue>6.790</ChargeValue>
                        <ChargeTaxRate>16.000</ChargeTaxRate>
                        <ChargeTaxAmount>0.940</ChargeTaxAmount>
                        <CurrencyCode>EUR</CurrencyCode>
                        <CurrencyRoleTypeCode>BASEC</CurrencyRoleTypeCode>
                        <ChargeTaxAmountDet>
                            <TaxTypeRate>16.000</TaxTypeRate>
                            <TaxTypeCode>IVA   </TaxTypeCode>
                            <TaxAmount>0.940</TaxAmount>
                            <BaseAmount>5.850</BaseAmount>
                        </ChargeTaxAmountDet>
                    </QtdSExtrChrgInAdCur>
                </QtdShpExChrg>
                <QtdShpExChrg>
                    <SpecialServiceType>FF</SpecialServiceType>
                    <LocalServiceType>FF</LocalServiceType>
                    <GlobalServiceName>FUEL SURCHARGE</GlobalServiceName>
                    <LocalServiceTypeName>FUEL SURCHARGE</LocalServiceTypeName>
                    <SOfferedCustAgreement>N</SOfferedCustAgreement>
                    <ChargeCodeType>SCH</ChargeCodeType>
                    <CurrencyCode>MXN</CurrencyCode>
                    <ChargeValue>63.060</ChargeValue>
                    <ChargeTaxAmount>8.700</ChargeTaxAmount>
                    <ChargeTaxAmountDet>
                        <TaxTypeRate>16.000</TaxTypeRate>
                        <TaxTypeCode>IVA   </TaxTypeCode>
                        <TaxAmount>8.700</TaxAmount>
                        <BaseAmount>54.360</BaseAmount>
                    </ChargeTaxAmountDet>
                    <QtdSExtrChrgInAdCur>
                        <ChargeValue>63.060</ChargeValue>
                        <ChargeTaxAmount>8.700</ChargeTaxAmount>
                        <CurrencyCode>MXN</CurrencyCode>
                        <CurrencyRoleTypeCode>BILLC</CurrencyRoleTypeCode>
                        <ChargeTaxAmountDet>
                            <TaxTypeRate>16.000</TaxTypeRate>
                            <TaxTypeCode>IVA   </TaxTypeCode>
                            <TaxAmount>8.700</TaxAmount>
                            <BaseAmount>54.360</BaseAmount>
                        </ChargeTaxAmountDet>
                    </QtdSExtrChrgInAdCur>
                    <QtdSExtrChrgInAdCur>
                        <ChargeValue>63.060</ChargeValue>
                        <ChargeTaxAmount>8.700</ChargeTaxAmount>
                        <CurrencyCode>MXN</CurrencyCode>
                        <CurrencyRoleTypeCode>PULCL</CurrencyRoleTypeCode>
                        <ChargeTaxAmountDet>
                            <TaxTypeRate>16.000</TaxTypeRate>
                            <TaxTypeCode>IVA   </TaxTypeCode>
                            <TaxAmount>8.700</TaxAmount>
                            <BaseAmount>54.360</BaseAmount>
                        </ChargeTaxAmountDet>
                    </QtdSExtrChrgInAdCur>
                    <QtdSExtrChrgInAdCur>
                        <ChargeValue>2.710</ChargeValue>
                        <ChargeTaxRate>16.000</ChargeTaxRate>
                        <ChargeTaxAmount>0.370</ChargeTaxAmount>
                        <CurrencyCode>EUR</CurrencyCode>
                        <CurrencyRoleTypeCode>BASEC</CurrencyRoleTypeCode>
                        <ChargeTaxAmountDet>
                            <TaxTypeRate>16.000</TaxTypeRate>
                            <TaxTypeCode>IVA   </TaxTypeCode>
                            <TaxAmount>0.370</TaxAmount>
                            <BaseAmount>2.340</BaseAmount>
                        </ChargeTaxAmountDet>
                    </QtdSExtrChrgInAdCur>
                </QtdShpExChrg>
                <PricingDate>2022-07-12</PricingDate>
                <ShippingCharge>810.170</ShippingCharge>
                <TotalTaxAmount>111.750</TotalTaxAmount>
                <QtdSInAdCur>
                    <CurrencyCode>MXN</CurrencyCode>
                    <CurrencyRoleTypeCode>BILLC</CurrencyRoleTypeCode>
                    <WeightCharge>589.560</WeightCharge>
                    <TotalAmount>810.170</TotalAmount>
                    <TotalTaxAmount>111.750</TotalTaxAmount>
                    <WeightChargeTax>81.320</WeightChargeTax>
                    <WeightChargeTaxDet>
                        <TaxTypeRate>16.000</TaxTypeRate>
                        <TaxTypeCode>IVA   </TaxTypeCode>
                        <WeightChargeTax>81.320</WeightChargeTax>
                        <BaseAmt>508.240</BaseAmt>
                    </WeightChargeTaxDet>
                </QtdSInAdCur>
                <QtdSInAdCur>
                    <CurrencyCode>MXN</CurrencyCode>
                    <CurrencyRoleTypeCode>PULCL</CurrencyRoleTypeCode>
                    <WeightCharge>589.560</WeightCharge>
                    <TotalAmount>810.170</TotalAmount>
                    <TotalTaxAmount>111.750</TotalTaxAmount>
                    <WeightChargeTax>81.320</WeightChargeTax>
                    <WeightChargeTaxDet>
                        <TaxTypeRate>16.000</TaxTypeRate>
                        <TaxTypeCode>IVA   </TaxTypeCode>
                        <WeightChargeTax>81.320</WeightChargeTax>
                        <BaseAmt>508.240</BaseAmt>
                    </WeightChargeTaxDet>
                </QtdSInAdCur>
                <QtdSInAdCur>
                    <ExchangeRate>0.043070</ExchangeRate>
                    <CurrencyCode>EUR</CurrencyCode>
                    <CurrencyRoleTypeCode>BASEC</CurrencyRoleTypeCode>
                    <WeightCharge>25.390</WeightCharge>
                    <TotalAmount>34.890</TotalAmount>
                    <TotalTaxAmount>4.810</TotalTaxAmount>
                    <WeightChargeTax>3.500</WeightChargeTax>
                    <WeightChargeTaxDet>
                        <TaxTypeRate>16.000</TaxTypeRate>
                        <TaxTypeCode>IVA   </TaxTypeCode>
                        <WeightChargeTax>3.500</WeightChargeTax>
                        <BaseAmt>21.890</BaseAmt>
                    </WeightChargeTaxDet>
                </QtdSInAdCur>
                <WeightChargeTaxDet>
                    <TaxTypeRate>16.000</TaxTypeRate>
                    <TaxTypeCode>IVA   </TaxTypeCode>
                    <WeightChargeTax>81.320</WeightChargeTax>
                    <BaseAmt>508.240</BaseAmt>
                </WeightChargeTaxDet>
            </QtdShp>
        </BkgDetails>
        <Srvs>
            <Srv>
                <GlobalProductCode>N</GlobalProductCode>
                <MrkSrv>
                    <LocalProductCode>N</LocalProductCode>
                    <ProductShortName>EXPRESS DOMESTIC</ProductShortName>
                    <LocalProductName>EXPRESS DOMESTIC</LocalProductName>
                    <ProductDesc>EXPRESS DOMESTIC</ProductDesc>
                    <NetworkTypeCode>TD</NetworkTypeCode>
                    <POfferedCustAgreement>N</POfferedCustAgreement>
                    <TransInd>Y</TransInd>
                </MrkSrv>
                <MrkSrv>
                    <LocalServiceType>FF</LocalServiceType>
                    <GlobalServiceName>FUEL SURCHARGE</GlobalServiceName>
                    <LocalServiceTypeName>FUEL SURCHARGE</LocalServiceTypeName>
                    <SOfferedCustAgreement>N</SOfferedCustAgreement>
                    <ChargeCodeType>SCH</ChargeCodeType>
                    <MrkSrvInd>N</MrkSrvInd>
                </MrkSrv>
                <MrkSrv>
                    <LocalServiceType>OO</LocalServiceType>
                    <GlobalServiceName>REMOTE AREA DELIVERY</GlobalServiceName>
                    <LocalServiceTypeName>REMOTE AREA DELIVERY</LocalServiceTypeName>
                    <SOfferedCustAgreement>N</SOfferedCustAgreement>
                    <ChargeCodeType>SCH</ChargeCodeType>
                    <MrkSrvInd>N</MrkSrvInd>
                </MrkSrv>
            </Srv>
        </Srvs>
    </GetQuoteResponse>
</res:DCTResponse>
<!-- ServiceInvocationId:20220712045719_52d4_01525ed4-7793-470a-881a-4480b4633ea1 -->
    ").to_xml

    Nori.new.parse(xml)
  end
end
