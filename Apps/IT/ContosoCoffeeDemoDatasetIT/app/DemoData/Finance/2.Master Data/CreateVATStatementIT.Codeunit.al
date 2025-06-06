// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace Microsoft.DemoData.Finance;

using Microsoft.Finance.VAT.Reporting;
using Microsoft.Foundation.Enums;
using Microsoft.DemoTool.Helpers;

codeunit 12229 "Create VAT Statement IT"
{
    SingleInstance = true;
    EventSubscriberInstance = Manual;
    InherentPermissions = X;
    InherentEntitlements = X;

    trigger OnRun()
    var
        VATStatementLine: Record "VAT Statement Line";
        CreateVATPostingGroups: Codeunit "Create VAT Posting Groups";
        CreateVATPostingGroupsIT: Codeunit "Create VAT Posting Groups IT";
        ContosoVATStatementIT: Codeunit "Contoso VAT Statement IT";
    begin
        ContosoVatStatement.InsertVATStatementTemplate(VATCommTemplateName(), AnnualVATCommunicationStatementDescLbl, Page::"Annual VAT Communication", Report::"Annual VAT Comm. - 2010");

        ContosoVatStatement.InsertVATStatementName(VATTemplateName(), VATDeclStatementNameLbl, DefaultStatementNameDescLbl);
        ContosoVatStatement.InsertVATStatementName(VATTemplateName(), VATSetlperStatementNameLbl, DefaultStatementNameDescLbl);
        ContosoVatStatement.InsertVATStatementName(VATCommTemplateName(), DefaultStatementNameLbl, AnnualVATCommunicationStatementDescLbl);

        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 390000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 400000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, VATPeriodicalReportingMonthLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 410000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 420000, '1010', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesBase20PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 430000, '1020', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesBase10PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 440000, '1021', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 450000, '1022', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '1010..1020', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, InternalOperationsLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 460000, '1024', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 470000, '1030', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesBase20PercEULbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 480000, '1040', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesBase10PercEULbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 490000, '1049', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 500000, '1050', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '1030..1049', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, IntraEUDisposalsVP2Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 510000, '1051', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 520000, '1052', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '1022|1050', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, ActiveOperationsVP1Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 530000, '1053', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 540000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 550000, '1110', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseBase20PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 560000, '1120', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseBase10PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 570000, '1125', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseBase20Perc50PercNondeductibleLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 580000, '1199', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '1110..1125', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PassiveOperationsVP3Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 590000, '1200', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 600000, '1210', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseBase20PercEULbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 610000, '1220', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseBase10PercEULbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 620000, '1290', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 630000, '1299', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '1210..1220', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, ReverseChargePurchaseVP4Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 640000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 650000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 660000, '5010', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesVAT20PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 670000, '5020', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesVAT10PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 680000, '5030', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesVATfromEUPurchase20PercLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 690000, '5040', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesVATfromEUPurchase10PercLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 700000, '5050', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Prior Period Input VAT", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PriorPeriodOutputVATLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 710000, '5060', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 720000, '5099', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '5010|5020|5030|5040|5050', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalOutputVATVP5Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 730000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 740000, '5110', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT20PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 750000, '5120', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT10PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 760000, '5130', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT20PercentEULbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 770000, '5140', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT10PercentEULbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 780000, '5150', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT20Perc50PercNondeductibleLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 790000, '5160', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Prior Period Output VAT", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, InputVATPriorPeriodVP7Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 800000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 810000, '5099', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '5110|5120|5130|5140|5150|5160', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalInputVATVP6Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 820000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 830000, '5500', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '5099|5199', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalVATtoPayVP10Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATDeclStatementNameLbl, 840000, '5510', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, IfVP10isNegativeReportItInVP11Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 850000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, VATSettlementMonthLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 860000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 870000, '5010', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesVAT20PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 880000, '5020', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesVAT10PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 890000, '5030', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesVATfromEUPurchase20PercLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 900000, '5040', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesVATfromEUPurchase10PercLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 910000, '5050', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Payab. VAT Variation", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PayableVATVariationLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 920000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 930000, '5099', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '5010..5050', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalPayableVATVP5Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 940000, '5110', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT20PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 950000, '5120', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT10PercNationalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 960000, '5130', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT20PercentEULbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 970000, '5140', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT10PercentEULbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 980000, '5150', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Deduc. VAT Variation.", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseVAT20Perc50PercNondeductibleLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 990000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1000000, '5199', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '5110..5160', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalDeductibleVATVP6Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1010000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1020000, '5200', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '5099|5199', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, VATBalanceforthePeriodVP7Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1030000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1040000, '5250', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Tax Debit Variat.", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PriorPeriodOutputTaxVariationVP8Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1050000, '5250', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Tax Deb. Variat. Int.", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PriorPeriodInputTaxVariationVP8Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1060000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1070000, '5300', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Tax Credit Variation", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PriorPeriodsUnpaidVATVP9Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1080000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1090000, '5500', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Prior Period Input VAT", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PriorPeriodOutputVATVP10Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1100000, '5510', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Prior Period Output VAT", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PriorPeriodInputVATVP10Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1110000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1120000, '5600', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Deduc. VAT Variation.", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, CreditVATCompensationVP11Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1130000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1140000, '5700', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '5200..5600', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, VATtoPayforthePeriodVP12Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1150000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1160000, '5800', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::"Special Credit", '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, DeductedSpecialCreditVP13Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1170000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1180000, '5900', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::Advanced, '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, AmountPaidinAdvVP15Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1190000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1200000, '6000', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '5700..5900', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, AmounttoPayVP16InputforthePeriodLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1210000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1220000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PaymentDateLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1230000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1240000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SubsidiaryLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1250000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, AbiCabLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1260000, '7000', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PaidAmountLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1270000, '', Enum::"VAT Statement Line Type"::"Periodic VAT Settl.", VATStatementLine."Gen. Posting Type"::Paid, '', '', '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1280000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, InfraannualCredrequestedasrefundLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1290000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, InfraannualCredtouseasCompensationLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATTemplateName(), VATSetlperStatementNameLbl, 1300000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1310000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, SalesLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1320000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1330000, '1', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, VATSales20PercLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1340000, '2', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, VATSales10PercLbl);
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1350000, 'CD1.1', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '1|2', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalSalesLbl, VATStatementLine."Annual VAT Comm. Field"::"CD1 - Total sales");
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1360000, '3', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, '', '', '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, SalesNonTaxableArt81Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1370000, '4', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, '', '', '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, SalesNonTaxableArt15Lbl);
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1380000, 'CD1.2', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '3|4', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalSalesNonTaxableLbl, VATStatementLine."Annual VAT Comm. Field"::"CD1 - Sales with zero VAT");
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1390000, '5', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroupsIT.E13(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, SalesExemptArt13Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1400000, '6', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Zero(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, SalesNoVATLbl);
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1410000, 'CD1.3', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '5|6', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalExemptSalesLbl, VATStatementLine."Annual VAT Comm. Field"::"CD1 - VAT exempt sales");
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1420000, '7', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, VAT20PercIntracomGoodSalesLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1430000, '8', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Sale, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, VAT10PercIntracomGoodSalesLbl);
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1440000, 'CD1.3', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '7|8', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalEUSalesLbl, VATStatementLine."Annual VAT Comm. Field"::"CD1 - EU sales");
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1450000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1460000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PurchaseLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1470000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1480000, '9', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, VATPurchases20PercLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1490000, '10', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, VATPurchases10PercLbl);
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1500000, 'CD2.1', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '9|10', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalPurchasesLbl, VATStatementLine."Annual VAT Comm. Field"::"CD2 - Total purchases");
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1510000, '11', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, '', '', '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, PurchaseNonTaxableArt81Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1520000, '12', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, '', '', '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, PurchaseNonTaxableArt15Lbl);
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1530000, 'CD2.2', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '11|12', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalPurchasesLbl, VATStatementLine."Annual VAT Comm. Field"::"CD2 - Purchases with zero VAT");
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1540000, '13', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroupsIT.E13(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, PurchasesExemptArt13Lbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1550000, '14', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Zero(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, PurchasesNonVATLbl);
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1560000, 'CD2.3', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '13|14', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalExemptPurchasesLbl, VATStatementLine."Annual VAT Comm. Field"::"CD2 - VAT exempt purchases");
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1570000, '15', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, VAT20PercIntracomGoodPurchasesLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1580000, '16', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", VATStatementLine."Gen. Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::"Opposite Sign", true, VATStatementLine."Print with"::Sign, VAT10PercIntracomGoodPurchasesLbl);
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1590000, 'CD2.4', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', '15|16', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalEUPurchasesLbl, VATStatementLine."Annual VAT Comm. Field"::"CD2 - EU purchases");
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1600000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1610000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1620000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, TotalLbl);
        ContosoVatStatementIT.InsertVatStatementLine(VATCommTemplateName(), DefaultStatementNameLbl, 1630000, '', Enum::"VAT Statement Line Type"::Description, VATStatementLine."Gen. Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1640000, 'CD4', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', 'CD1*', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, PayableVATLbl, VATStatementLine."Annual VAT Comm. Field"::"CD4 - Payable VAT");
        ContosoVatStatementIT.InsertVatStatementLineWithAnnualVATCommField(VATCommTemplateName(), DefaultStatementNameLbl, 1650000, 'CD4', Enum::"VAT Statement Line Type"::"Row Totaling", VATStatementLine."Gen. Posting Type"::" ", '', '', 'CD2*', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, ReceivableVATLbl, VATStatementLine."Annual VAT Comm. Field"::"CD5 - Receivable VAT");

    end;

    [EventSubscriber(ObjectType::Table, Database::"VAT Statement Line", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeInsertVatStatementLine(var Rec: Record "VAT Statement Line")
    var
        VATStatementLine: Record "VAT Statement Line";
        CreateVATStatement: Codeunit "Create VAT Statement";
        CreateVATPostingGroups: Codeunit "Create VAT Posting Groups";
    begin
        if (Rec."Statement Template Name" = CreateVATStatement.VATTemplateName()) and (Rec."Statement Name" = DefaultStatementNameLbl) then
            case Rec."Line No." of
                10000:
                    ValidateRecordFields(Rec, '1010', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::"Opposite Sign", SalesVat20PercOutgoingLbl);
                20000:
                    ValidateRecordFields(Rec, '1020', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::"Opposite Sign", SalesVat10PercOutgoingLbl);
                30000:
                    ValidateRecordFields(Rec, '1050', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::"Opposite Sign", false, VATStatementLine."Print with"::"Opposite Sign", Vat20PercPercOnEuPurchasesEtcLbl);
                40000:
                    ValidateRecordFields(Rec, '1060', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::"Opposite Sign", false, VATStatementLine."Print with"::"Opposite Sign", Vat10PercPercOnEuPurchasesEtcLbl);
                50000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
                60000:
                    ValidateRecordFields(Rec, '1099', Enum::"VAT Statement Line Type"::"Row Totaling", '', Enum::"General Posting Type"::" ", '', '', '1010..1090', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", TotalLbl);
                70000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
                80000:
                    ValidateRecordFields(Rec, '1110', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, PurchaseVat20PercDomesticLbl);
                90000:
                    ValidateRecordFields(Rec, '1120', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Purchase, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, PurchaseVat10PercDomesticLbl);
                100000:
                    ValidateRecordFields(Rec, '1150', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, PurchaseVat20PercEuLbl);
                110000:
                    ValidateRecordFields(Rec, '1160', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Amount", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, PurchaseVat10PercEuLbl);
                120000:
                    ValidateRecordFields(Rec, '1179', Enum::"VAT Statement Line Type"::"Row Totaling", '', Enum::"General Posting Type"::" ", '', '', '1110..1170', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", PurchaseVatIngoingLbl);
                130000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
                140000:
                    ValidateRecordFields(Rec, '1180', Enum::"VAT Statement Line Type"::"Account Totaling", '5710', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", FuelTaxLbl);
                150000:
                    ValidateRecordFields(Rec, '1181', Enum::"VAT Statement Line Type"::"Account Totaling", '5720', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", ElectricityTaxLbl);
                160000:
                    ValidateRecordFields(Rec, '1182', Enum::"VAT Statement Line Type"::"Account Totaling", '5730', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", NaturalGasTaxLbl);
                170000:
                    ValidateRecordFields(Rec, '1183', Enum::"VAT Statement Line Type"::"Account Totaling", '5740', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", CoalTaxLbl);
                180000:
                    ValidateRecordFields(Rec, '1184', Enum::"VAT Statement Line Type"::"Account Totaling", '5750', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", Co2TaxLbl);
                190000:
                    ValidateRecordFields(Rec, '1185', Enum::"VAT Statement Line Type"::"Account Totaling", '5760', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", WaterTaxLbl);
                200000:
                    ValidateRecordFields(Rec, '1189', Enum::"VAT Statement Line Type"::"Row Totaling", '', Enum::"General Posting Type"::" ", '', '', '1180..1188', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", TotalTaxesLbl);
                210000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
                220000:
                    ValidateRecordFields(Rec, '1199', Enum::"VAT Statement Line Type"::"Row Totaling", '', Enum::"General Posting Type"::" ", '', '', '1159|1189', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", TotalDeductionsLbl);
                230000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
                240000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
                250000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::"Row Totaling", '', Enum::"General Posting Type"::" ", '', '', '1099|1199', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", VatPayableLbl);
                260000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, BlankLbl);
                270000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
                280000:
                    ValidateRecordFields(Rec, '1210', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, ValueOfEuPurchases20PercLbl);
                290000:
                    ValidateRecordFields(Rec, '1220', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Purchase, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, ValueOfEuPurchases10PercLbl);
                300000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
                310000:
                    ValidateRecordFields(Rec, '1240', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Sale, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::"Opposite Sign", ValueOfEuSales20PercLbl);
                320000:
                    ValidateRecordFields(Rec, '1250', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Sale, CreateVATPostingGroups.EU(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::"Opposite Sign", ValueOfEuSales10PercLbl);
                330000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::Description, '', Enum::"General Posting Type"::" ", '', '', '', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::Sign, '');
                340000:
                    ValidateRecordFields(Rec, '1310', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Sale, CreateVATPostingGroups.EXPORT(), CreateVATPostingGroups.Standard(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, NonVatLiableSalesOverseasLbl);
                350000:
                    ValidateRecordFields(Rec, '1320', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Sale, CreateVATPostingGroups.EXPORT(), CreateVATPostingGroups.Reduced(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, NonVatLiableSalesOverseasLbl);
                360000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::"Row Totaling", '', Enum::"General Posting Type"::" ", '', '', '1310..1330', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", NonVatLiableSalesOverseasLbl);
                370000:
                    ValidateRecordFields(Rec, '1340', Enum::"VAT Statement Line Type"::"VAT Entry Totaling", '', Enum::"General Posting Type"::Sale, CreateVATPostingGroups.Domestic(), CreateVATPostingGroups.ZERO(), '', Enum::"VAT Statement Line Amount Type"::"Base", VATStatementLine."Calculate with"::Sign, false, VATStatementLine."Print with"::Sign, NonVatLiableSalesDomesticLbl);
                380000:
                    ValidateRecordFields(Rec, '', Enum::"VAT Statement Line Type"::"Row Totaling", '', Enum::"General Posting Type"::" ", '', '', '1340..1348', Enum::"VAT Statement Line Amount Type"::" ", VATStatementLine."Calculate with"::Sign, true, VATStatementLine."Print with"::"Opposite Sign", NonVatLiableSalesDomesticLbl);
            end;
    end;

    procedure VATTemplateName(): Code[10]
    begin
        exit(VATTemplateNameTok);
    end;

    procedure VATCommTemplateName(): Code[10]
    begin
        exit(VATCommTemplateNameTok);
    end;

    local procedure ValidateRecordFields(var VATStatementLine: Record "VAT Statement Line"; StatementRowNo: Code[10]; StatementLineType: Enum "VAT Statement Line Type"; AccountTotaling: Text[30]; GenPostingType: Enum "General Posting Type"; VatBusPostingGrp: Code[20]; VAtProdPostingGrp: Code[20]; RowTotaling: Text[50]; AmountType: Enum "VAT Statement Line Amount Type"; CalulationWith: Option; StatementPrint: Boolean; PrintWith: Option; StatementDesc: Text[100])
    begin
        VatStatementLine.Validate("Row No.", StatementRowNo);
        VatStatementLine.Validate(Description, StatementDesc);
        VatStatementLine.Validate(Type, StatementLineType);
        VATStatementLine.Validate("Account Totaling", AccountTotaling);
        VatStatementLine.Validate("Gen. Posting Type", GenPostingType);
        VatStatementLine.Validate("VAT Bus. Posting Group", VatBusPostingGrp);
        VatStatementLine.Validate("VAT Prod. Posting Group", VAtProdPostingGrp);
        VatStatementLine.Validate("Row Totaling", RowTotaling);
        VatStatementLine.Validate("Amount Type", AmountType);
        VatStatementLine.Validate("Calculate with", CalulationWith);
        VatStatementLine.Validate(Print, StatementPrint);
        VatStatementLine.Validate("Print with", PrintWith);
    end;

    var
        ContosoVatStatement: Codeunit "Contoso VAT Statement";
        VATTemplateNameTok: Label 'VAT', Locked = true;
        VATCommTemplateNameTok: Label 'VAT COMM', Locked = true;
        DefaultStatementNameLbl: Label 'DEFAULT', MaxLength = 10;
        VATDeclStatementNameLbl: Label 'VATDECL', MaxLength = 10;
        VATSetlperStatementNameLbl: Label 'VATSETLPER', MaxLength = 10;
        DefaultStatementNameDescLbl: Label 'Default Statement', MaxLength = 100;
        AnnualVATCommunicationStatementDescLbl: Label 'Annual VAT Communication', MaxLength = 80;
        SalesVat20PercOutgoingLbl: Label 'Sales VAT 20 % (outgoing)', MaxLength = 100;
        SalesVat10PercOutgoingLbl: Label 'Sales VAT 10 % (outgoing)', MaxLength = 100;
        Vat20PercPercOnEuPurchasesEtcLbl: Label 'VAT 20 % % on EU Purchases etc.', MaxLength = 100;
        Vat10PercPercOnEuPurchasesEtcLbl: Label 'VAT 10 % % on EU Purchases etc.', MaxLength = 100;
        TotalLbl: Label 'Total', MaxLength = 100;
        PurchaseVat20PercDomesticLbl: Label 'Purchase VAT 20 % Domestic', MaxLength = 100;
        PurchaseVat10PercDomesticLbl: Label 'Purchase VAT 10 % Domestic', MaxLength = 100;
        PurchaseVatIngoingLbl: Label 'Purchase VAT (ingoing)', MaxLength = 100;
        FuelTaxLbl: Label 'Fuel Tax', MaxLength = 100;
        ElectricityTaxLbl: Label 'Electricity Tax', MaxLength = 100;
        NaturalGasTaxLbl: Label 'Natural Gas Tax', MaxLength = 100;
        CoalTaxLbl: Label 'Coal Tax', MaxLength = 100;
        Co2TaxLbl: Label 'CO2 Tax', MaxLength = 100;
        WaterTaxLbl: Label 'Water Tax', MaxLength = 100;
        TotalTaxesLbl: Label 'Total Taxes', MaxLength = 100;
        BlankLbl: Label '--------------------------------------------------', MaxLength = 100;
        TotalDeductionsLbl: Label 'Total Deductions', MaxLength = 100;
        VatPayableLbl: Label 'VAT Payable', MaxLength = 100;
        ValueOfEuPurchases20PercLbl: Label 'Value of EU Purchases 20 %', MaxLength = 100;
        ValueOfEuPurchases10PercLbl: Label 'Value of EU Purchases 10 %', MaxLength = 100;
        ValueOfEuSales20PercLbl: Label 'Value of EU Sales 20 %', MaxLength = 100;
        ValueOfEuSales10PercLbl: Label 'Value of EU Sales 10 %', MaxLength = 100;
        NonVatLiableSalesOverseasLbl: Label 'Non-VAT liable sales, Overseas', MaxLength = 100;
        NonVatLiableSalesDomesticLbl: Label 'Non-VAT liable sales, Domestic', MaxLength = 100;
        VATPeriodicalReportingMonthLbl: Label 'VAT Periodical Reporting Month .........', MaxLength = 100;
        SalesBase20PercNationalLbl: Label 'Sales Base 20% - National', MaxLength = 100;
        SalesBase10PercNationalLbl: Label 'Sales Base 10% - National', MaxLength = 100;
        InternalOperationsLbl: Label 'Internal Operations', MaxLength = 100;
        SalesBase20PercEULbl: Label 'Sales Base 20% - EU', MaxLength = 100;
        SalesBase10PercEULbl: Label 'Sales Base 10% - EU', MaxLength = 100;
        IntraEUDisposalsVP2Lbl: Label 'Intra EU Disposals - VP2', MaxLength = 100;
        ActiveOperationsVP1Lbl: Label 'Active Operations - VP1', MaxLength = 100;
        PurchaseBase20PercNationalLbl: Label 'Purchase Base 20% - National', MaxLength = 100;
        PurchaseBase10PercNationalLbl: Label 'Purchase Base 10% - National', MaxLength = 100;
        PurchaseBase20Perc50PercNondeductibleLbl: Label 'Purchase Base 20% - 50% Nondeductible', MaxLength = 100;
        PassiveOperationsVP3Lbl: Label 'Passive Operations - VP3', MaxLength = 100;
        PurchaseBase20PercEULbl: Label 'Purchase Base 20% - EU', MaxLength = 100;
        PurchaseBase10PercEULbl: Label 'Purchase Base 10% - EU', MaxLength = 100;
        ReverseChargePurchaseVP4Lbl: Label 'Reverse Charge Purchase - VP4', MaxLength = 100;
        SalesVAT20PercNationalLbl: Label 'Sales VAT 20% - National', MaxLength = 100;
        PriorPeriodOutputVATLbl: Label 'Prior Period Output VAT', MaxLength = 100;
        TotalOutputVATVP5Lbl: Label 'Total Output VAT - VP5', MaxLength = 100;
        InputVATPriorPeriodVP7Lbl: Label 'Input VAT Prior Period - VP7', MaxLength = 100;
        TotalInputVATVP6Lbl: Label 'Total Input VAT - VP6', MaxLength = 100;
        TotalVATtoPayVP10Lbl: Label 'Total VAT to Pay - VP10', MaxLength = 100;
        IfVP10isNegativeReportItInVP11Lbl: Label 'If VP10 is negative, report it in  VP11', MaxLength = 100;
        VATSettlementMonthLbl: Label 'VAT Settlement Month ________', MaxLength = 100;
        SalesVAT10PercNationalLbl: Label 'Sales VAT 10% - National', MaxLength = 100;
        SalesVATfromEUPurchase20PercLbl: Label 'Sales VAT from EU Purchase - 20%', MaxLength = 100;
        SalesVATfromEUPurchase10PercLbl: Label 'Sales VAT from EU Purchase - 10%', MaxLength = 100;
        PayableVATVariationLbl: Label 'Payable VAT Variation', MaxLength = 100;
        TotalPayableVATVP5Lbl: Label 'Total Payable VAT - VP5', MaxLength = 100;
        PurchaseVAT20PercNationalLbl: Label 'Purchase VAT 20% - National', MaxLength = 100;
        PurchaseVAT10PercNationalLbl: Label 'Purchase VAT 10% - National', MaxLength = 100;
        PurchaseVAT20PercEULbl: Label 'Purchase VAT 20 % EU', MaxLength = 100;
        PurchaseVAT20PercentEULbl: Label 'Purchase VAT 20% - EU', MaxLength = 100;
        PurchaseVAT10PercEULbl: Label 'Purchase VAT 10 % EU', MaxLength = 100;
        PurchaseVAT10PercentEULbl: Label 'Purchase VAT 10% - EU', MaxLength = 100;
        PurchaseVAT20Perc50PercNondeductibleLbl: Label 'Purchase VAT 20% - 50% Nondeductible', MaxLength = 100;
        TotalDeductibleVATVP6Lbl: Label 'Total Deductible VAT - VP6', MaxLength = 100;
        VATBalanceforthePeriodVP7Lbl: Label 'VAT Balance for the Period - VP7', MaxLength = 100;
        PriorPeriodOutputTaxVariationVP8Lbl: Label 'Prior Period Output Tax Variation - VP8', MaxLength = 100;
        PriorPeriodInputTaxVariationVP8Lbl: Label 'Prior Period Input Tax Variation - VP8', MaxLength = 100;
        PriorPeriodsUnpaidVATVP9Lbl: Label 'Prior Periods Unpaid VAT - VP9', MaxLength = 100;
        PriorPeriodOutputVATVP10Lbl: Label 'Prior Period Output VAT - VP10', MaxLength = 100;
        PriorPeriodInputVATVP10Lbl: Label 'Prior Period Input VAT - VP10', MaxLength = 100;
        CreditVATCompensationVP11Lbl: Label 'Credit VAT Compensation - VP11', MaxLength = 100;
        VATtoPayforthePeriodVP12Lbl: Label 'VAT to Pay for the Period - VP12', MaxLength = 100;
        DeductedSpecialCreditVP13Lbl: Label 'Deducted Special Credit - VP13', MaxLength = 100;
        AmountPaidinAdvVP15Lbl: Label 'Amount Paid in Adv. - VP15', MaxLength = 100;

        AmounttoPayVP16InputforthePeriodLbl: Label 'Amount to Pay - VP16 / Input for the Period', MaxLength = 100;
        PaymentDateLbl: Label 'Payment Date :__________________________________', MaxLength = 100;
        BankLbl: Label 'Bank :___________________________________________', MaxLength = 100;
        SubsidiaryLbl: Label 'Subsidiary :______________________________________', MaxLength = 100;
        AbiCabLbl: Label 'Abi/Cab :__________________________________', MaxLength = 100;
        PaidAmountLbl: Label 'Paid Amount :____________________________________', MaxLength = 100;

        InfraannualCredrequestedasrefundLbl: Label 'Infra-annual Cred. requested as refund:', MaxLength = 100;
        InfraannualCredtouseasCompensationLbl: Label 'Infra-annual Cred. to use as Compensation :', MaxLength = 100;

        SalesLbl: Label 'Sales:', MaxLength = 100;

        VATSales20PercLbl: Label 'VAT Sales 20 %', MaxLength = 100;
        VATSales10PercLbl: Label 'VAT Sales 10 %', MaxLength = 100;
        TotalSalesLbl: Label 'Total Sales', MaxLength = 100;
        SalesNonTaxableArt81Lbl: Label 'Sales Non-Taxable Art 8/1', MaxLength = 100;
        SalesNonTaxableArt15Lbl: Label 'Sales Non-Taxable Art 15', MaxLength = 100;
        TotalSalesNonTaxableLbl: Label 'Total Sales Non-Taxable', MaxLength = 100;
        SalesExemptArt13Lbl: Label 'Sales Exempt - Art 13', MaxLength = 100;
        SalesNoVATLbl: Label 'Sales No VAT', MaxLength = 100;
        TotalExemptSalesLbl: Label 'Total Exempt Sales', MaxLength = 100;
        VAT20PercIntracomGoodSalesLbl: Label 'VAT 20% Intracom Good Sales', MaxLength = 100;
        VAT10PercIntracomGoodSalesLbl: Label 'VAT 10% Intracom Good Sales', MaxLength = 100;
        TotalEUSalesLbl: Label 'Total EU Sales', MaxLength = 100;
        PurchaseLbl: Label 'Purchase:', MaxLength = 100;
        VATPurchases20PercLbl: Label 'VAT Purchases 20%', MaxLength = 100;
        VATPurchases10PercLbl: Label 'VAT Purchases 10%', MaxLength = 100;
        TotalPurchasesLbl: Label 'Total Purchases', MaxLength = 100;
        PurchaseNonTaxableArt81Lbl: Label 'Purchase Non-Taxable Art 8/1', MaxLength = 100;
        PurchaseNonTaxableArt15Lbl: Label 'Purchase Non-Taxable Art 15', MaxLength = 100;
        PurchasesExemptArt13Lbl: Label 'Purchases Exempt - Art 13', MaxLength = 100;
        PurchasesNonVATLbl: Label 'Purchases Non VAT', MaxLength = 100;
        TotalExemptPurchasesLbl: Label 'Total Exempt Purchases', MaxLength = 100;
        VAT20PercIntracomGoodPurchasesLbl: Label 'VAT 20% Intracom Good Purchases', MaxLength = 100;
        VAT10PercIntracomGoodPurchasesLbl: Label 'VAT 10% Intracom GoodPurchases', MaxLength = 100;
        TotalEUPurchasesLbl: Label 'Total EU Purchases', MaxLength = 100;
        PayableVATLbl: Label 'Payable VAT', MaxLength = 100;
        ReceivableVATLbl: Label 'Receivable VAT', MaxLength = 100;
}
