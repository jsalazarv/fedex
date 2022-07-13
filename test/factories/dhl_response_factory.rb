require 'nokogiri'
require 'nori'

class DhlResponseFactory
  def self.createResponse
    xml = Nokogiri::XML("
<DCTResponse xmlns:res='http://www.dhl.com' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:schemaLocation= 'http://www.dhl.com DCT-Response.xsd'>
  <GetQuoteResponse>
    <Response>
      <ServiceHeader>
        <MessageTime>2022-07-12T23:31:16.387+00:00</MessageTime>
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
        <GlobalProductCode>G</GlobalProductCode>
        <LocalProductCode>G</LocalProductCode>
        <ProductShortName>ECONOMY SELECT DOMESTIC</ProductShortName>
        <LocalProductName>ECONOMY SELECT DOMESTIC</LocalProductName>
        <NetworkTypeCode>DD</NetworkTypeCode>
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
          <ChargeValue>111.310</ChargeValue>
          <ChargeTaxAmount>15.350</ChargeTaxAmount>
          <ChargeTaxAmountDet>
            <TaxTypeRate>16.000</TaxTypeRate>
            <TaxTypeCode>IVA   </TaxTypeCode>
            <TaxAmount>15.350</TaxAmount>
            <BaseAmount>95.960</BaseAmount>
          </ChargeTaxAmountDet>
          <QtdSExtrChrgInAdCur>
            <ChargeValue>111.310</ChargeValue>
            <ChargeTaxAmount>15.350</ChargeTaxAmount>
            <CurrencyCode>MXN</CurrencyCode>
            <CurrencyRoleTypeCode>BILLC</CurrencyRoleTypeCode>
            <ChargeTaxAmountDet>
              <TaxTypeRate>16.000</TaxTypeRate>
              <TaxTypeCode>IVA   </TaxTypeCode>
              <TaxAmount>15.350</TaxAmount>
              <BaseAmount>95.960</BaseAmount>
            </ChargeTaxAmountDet>
          </QtdSExtrChrgInAdCur>
          <QtdSExtrChrgInAdCur>
            <ChargeValue>111.310</ChargeValue>
            <ChargeTaxAmount>15.350</ChargeTaxAmount>
            <CurrencyCode>MXN</CurrencyCode>
            <CurrencyRoleTypeCode>PULCL</CurrencyRoleTypeCode>
            <ChargeTaxAmountDet>
              <TaxTypeRate>16.000</TaxTypeRate>
              <TaxTypeCode>IVA   </TaxTypeCode>
              <TaxAmount>15.350</TaxAmount>
              <BaseAmount>95.960</BaseAmount>
            </ChargeTaxAmountDet>
          </QtdSExtrChrgInAdCur>
          <QtdSExtrChrgInAdCur>
            <ChargeValue>4.790</ChargeValue>
            <ChargeTaxRate>16.000</ChargeTaxRate>
            <ChargeTaxAmount>0.660</ChargeTaxAmount>
            <CurrencyCode>EUR</CurrencyCode>
            <CurrencyRoleTypeCode>BASEC</CurrencyRoleTypeCode>
            <ChargeTaxAmountDet>
              <TaxTypeRate>16.000</TaxTypeRate>
              <TaxTypeCode>IVA   </TaxTypeCode>
              <TaxAmount>0.660</TaxAmount>
              <BaseAmount>4.130</BaseAmount>
            </ChargeTaxAmountDet>
          </QtdSExtrChrgInAdCur>
        </QtdShpExChrg>
        <PricingDate>2022-07-13</PricingDate>
        <ShippingCharge>858.420</ShippingCharge>
        <TotalTaxAmount>118.400</TotalTaxAmount>
        <QtdSInAdCur>
          <CurrencyCode>MXN</CurrencyCode>
          <CurrencyRoleTypeCode>BILLC</CurrencyRoleTypeCode>
          <WeightCharge>589.560</WeightCharge>
          <TotalAmount>858.420</TotalAmount>
          <TotalTaxAmount>118.400</TotalTaxAmount>
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
          <TotalAmount>858.420</TotalAmount>
          <TotalTaxAmount>118.400</TotalTaxAmount>
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
          <TotalAmount>36.970</TotalAmount>
          <TotalTaxAmount>5.100</TotalTaxAmount>
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
      <QtdShp>
        <GlobalProductCode>J</GlobalProductCode>
        <LocalProductCode>U</LocalProductCode>
        <ProductShortName>DOMESTIC SHIPMENT DEPARTURE</ProductShortName>
        <LocalProductName>DOMESTIC SHIPMENT DEPARTURE</LocalProductName>
        <NetworkTypeCode>TD</NetworkTypeCode>
        <POfferedCustAgreement>Y</POfferedCustAgreement>
        <TransInd>N</TransInd>
        <PickupDate>2022-02-08</PickupDate>
        <PickupCutoffTime>PT18H15M</PickupCutoffTime>
        <BookingTime>PT15H15M</BookingTime>
        <ExchangeRate>0.043070</ExchangeRate>
        <WeightCharge>0</WeightCharge>
        <WeightChargeTax>0.000</WeightChargeTax>
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
          <ChargeValue>23.480</ChargeValue>
          <ChargeTaxAmount>3.240</ChargeTaxAmount>
          <ChargeTaxAmountDet>
            <TaxTypeRate>16.000</TaxTypeRate>
            <TaxTypeCode>IVA   </TaxTypeCode>
            <TaxAmount>3.240</TaxAmount>
            <BaseAmount>20.240</BaseAmount>
          </ChargeTaxAmountDet>
          <QtdSExtrChrgInAdCur>
            <ChargeValue>23.480</ChargeValue>
            <ChargeTaxAmount>3.240</ChargeTaxAmount>
            <CurrencyCode>MXN</CurrencyCode>
            <CurrencyRoleTypeCode>BILLC</CurrencyRoleTypeCode>
            <ChargeTaxAmountDet>
              <TaxTypeRate>16.000</TaxTypeRate>
              <TaxTypeCode>IVA   </TaxTypeCode>
              <TaxAmount>3.240</TaxAmount>
              <BaseAmount>20.240</BaseAmount>
            </ChargeTaxAmountDet>
          </QtdSExtrChrgInAdCur>
          <QtdSExtrChrgInAdCur>
            <ChargeValue>23.480</ChargeValue>
            <ChargeTaxAmount>3.240</ChargeTaxAmount>
            <CurrencyCode>MXN</CurrencyCode>
            <CurrencyRoleTypeCode>PULCL</CurrencyRoleTypeCode>
            <ChargeTaxAmountDet>
              <TaxTypeRate>16.000</TaxTypeRate>
              <TaxTypeCode>IVA   </TaxTypeCode>
              <TaxAmount>3.240</TaxAmount>
              <BaseAmount>20.240</BaseAmount>
            </ChargeTaxAmountDet>
          </QtdSExtrChrgInAdCur>
          <QtdSExtrChrgInAdCur>
            <ChargeValue>1.010</ChargeValue>
            <ChargeTaxRate>16.000</ChargeTaxRate>
            <ChargeTaxAmount>0.140</ChargeTaxAmount>
            <CurrencyCode>EUR</CurrencyCode>
            <CurrencyRoleTypeCode>BASEC</CurrencyRoleTypeCode>
            <ChargeTaxAmountDet>
              <TaxTypeRate>16.000</TaxTypeRate>
              <TaxTypeCode>IVA   </TaxTypeCode>
              <TaxAmount>0.140</TaxAmount>
              <BaseAmount>0.870</BaseAmount>
            </ChargeTaxAmountDet>
          </QtdSExtrChrgInAdCur>
        </QtdShpExChrg>
        <PricingDate>2022-07-13</PricingDate>
        <ShippingCharge>0.000</ShippingCharge>
        <TotalTaxAmount>0.000</TotalTaxAmount>
        <QtdSInAdCur>
          <CurrencyRoleTypeCode>BILLC</CurrencyRoleTypeCode>
          <WeightCharge>0</WeightCharge>
          <TotalAmount>0.000</TotalAmount>
          <TotalTaxAmount>0.000</TotalTaxAmount>
          <WeightChargeTax>0.000</WeightChargeTax>
        </QtdSInAdCur>
        <QtdSInAdCur>
          <CurrencyCode>EUR</CurrencyCode>
          <CurrencyRoleTypeCode>PULCL</CurrencyRoleTypeCode>
          <WeightCharge>0</WeightCharge>
          <TotalAmount>0.000</TotalAmount>
          <TotalTaxAmount>0.000</TotalTaxAmount>
          <WeightChargeTax>0.000</WeightChargeTax>
        </QtdSInAdCur>
        <QtdSInAdCur>
          <CurrencyCode>EUR</CurrencyCode>
          <CurrencyRoleTypeCode>BASEC</CurrencyRoleTypeCode>
          <WeightCharge>0</WeightCharge>
          <TotalAmount>0.000</TotalAmount>
          <TotalTaxAmount>0.000</TotalTaxAmount>
          <WeightChargeTax>0.000</WeightChargeTax>
        </QtdSInAdCur>
      </QtdShp>
    </BkgDetails>
    <Srvs>
      <Srv>
        <GlobalProductCode>G</GlobalProductCode>
        <MrkSrv>
          <LocalProductCode>G</LocalProductCode>
          <ProductShortName>ECONOMY SELECT DOMESTIC</ProductShortName>
          <LocalProductName>ECONOMY SELECT DOMESTIC</LocalProductName>
          <ProductDesc>ECONOMY SELECT DOMESTIC</ProductDesc>
          <NetworkTypeCode>DD</NetworkTypeCode>
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
      <Srv>
        <GlobalProductCode>J</GlobalProductCode>
        <MrkSrv>
          <LocalProductCode>U</LocalProductCode>
          <ProductShortName>DOMESTIC SHIPMENT DEPARTURE</ProductShortName>
          <LocalProductName>DOMESTIC SHIPMENT DEPARTURE</LocalProductName>
          <ProductDesc>DOMESTIC SHIPMENT DEPARTURE</ProductDesc>
          <NetworkTypeCode>TD</NetworkTypeCode>
          <POfferedCustAgreement>Y</POfferedCustAgreement>
          <TransInd>N</TransInd>
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
      <Srv>
        <GlobalProductCode>7</GlobalProductCode>
        <MrkSrv>
          <LocalProductCode>7</LocalProductCode>
          <ProductShortName>EXPRESS EASY DOC</ProductShortName>
          <LocalProductName>EXPRESS EASY DOC</LocalProductName>
          <ProductDesc>EXPRESS EASY DOC</ProductDesc>
          <NetworkTypeCode>TD</NetworkTypeCode>
          <POfferedCustAgreement>Y</POfferedCustAgreement>
          <TransInd>N</TransInd>
        </MrkSrv>
      </Srv>
      <Srv>
        <GlobalProductCode>5</GlobalProductCode>
        <MrkSrv>
          <LocalProductCode>V</LocalProductCode>
          <ProductShortName>EXPRESS EDOMM</ProductShortName>
          <LocalProductName>EXPRESS EDOMM</LocalProductName>
          <ProductDesc>EXPRESS EDOMM</ProductDesc>
          <NetworkTypeCode>TD</NetworkTypeCode>
          <POfferedCustAgreement>Y</POfferedCustAgreement>
          <TransInd>N</TransInd>
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
      <Srv>
        <GlobalProductCode>J</GlobalProductCode>
        <MrkSrv>
          <LocalProductCode>6</LocalProductCode>
          <ProductShortName>DOMESTICO ENVIO RETORNO</ProductShortName>
          <LocalProductName>DOMESTICO ENVIO RETORNO</LocalProductName>
          <ProductDesc>DOMESTICO ENVIO RETORNO</ProductDesc>
          <NetworkTypeCode>TD</NetworkTypeCode>
          <POfferedCustAgreement>Y</POfferedCustAgreement>
          <TransInd>N</TransInd>
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
      <Srv>
        <GlobalProductCode>5</GlobalProductCode>
        <MrkSrv>
          <LocalProductCode>W</LocalProductCode>
          <ProductShortName>SAMEDAY SPRINTLINE</ProductShortName>
          <LocalProductName>SPRINTLINE</LocalProductName>
          <ProductDesc>SPRINTLINE</ProductDesc>
          <NetworkTypeCode>TD</NetworkTypeCode>
          <POfferedCustAgreement>Y</POfferedCustAgreement>
          <TransInd>N</TransInd>
        </MrkSrv>
      </Srv>
    </Srvs>
  </GetQuoteResponse>
</DCTResponse>
        <!-- ServiceInvocationId:20220712233116_52d4_60d1e717-47b6-4e93-b1ed-4b7adb6e02a9 -->").to_xml

    Nori.new.parse(xml)
  end
end
