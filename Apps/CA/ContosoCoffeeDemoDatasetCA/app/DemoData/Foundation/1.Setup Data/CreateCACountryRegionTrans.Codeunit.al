// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace Microsoft.DemoData.Foundation;

using Microsoft.DemoTool.Helpers;

codeunit 27078 "Create CA CountryRegion Trans."
{
    InherentEntitlements = X;
    InherentPermissions = X;

    trigger OnRun()
    var
        ContosoCATranslation: Codeunit "Contoso CA Translation";
        CreateCountryRegion: Codeunit "Create Country/Region";
        CreateLanguage: Codeunit "Create Language";
    begin
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.AE(), CreateLanguage.FRC(), AENameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.AT(), CreateLanguage.FRC(), ATNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.AU(), CreateLanguage.FRC(), AUNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.BE(), CreateLanguage.FRC(), BENameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.BG(), CreateLanguage.FRC(), BGNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.BN(), CreateLanguage.FRC(), BNNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.BR(), CreateLanguage.FRC(), BRNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.CA(), CreateLanguage.FRC(), CANameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.CH(), CreateLanguage.FRC(), CHNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.CN(), CreateLanguage.FRC(), CNNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.CY(), CreateLanguage.FRC(), CYNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.CZ(), CreateLanguage.FRC(), CZNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.DE(), CreateLanguage.FRC(), DENameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.DK(), CreateLanguage.FRC(), DKNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.DZ(), CreateLanguage.FRC(), DZNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.EE(), CreateLanguage.FRC(), EENameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.EL(), CreateLanguage.FRC(), ELNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.ES(), CreateLanguage.FRC(), ESNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.FI(), CreateLanguage.FRC(), FINameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.FJ(), CreateLanguage.FRC(), FJNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.FR(), CreateLanguage.FRC(), FRNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.GB(), CreateLanguage.FRC(), GBNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.HR(), CreateLanguage.FRC(), HRNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.HU(), CreateLanguage.FRC(), HUNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.ID(), CreateLanguage.FRC(), IDNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.IE(), CreateLanguage.FRC(), IENameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.IND(), CreateLanguage.FRC(), INNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.IS(), CreateLanguage.FRC(), ISNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.IT(), CreateLanguage.FRC(), ITNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.JP(), CreateLanguage.FRC(), JPNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.KE(), CreateLanguage.FRC(), KENameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.LT(), CreateLanguage.FRC(), LTNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.LU(), CreateLanguage.FRC(), LUNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.LV(), CreateLanguage.FRC(), LVNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.MA(), CreateLanguage.FRC(), MANameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.ME(), CreateLanguage.FRC(), MENameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.MT(), CreateLanguage.FRC(), MTNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.MX(), CreateLanguage.FRC(), MXNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.MY(), CreateLanguage.FRC(), MYNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.MZ(), CreateLanguage.FRC(), MZNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.NG(), CreateLanguage.FRC(), NGNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.NL(), CreateLanguage.FRC(), NLNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.NO(), CreateLanguage.FRC(), NONameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.NZ(), CreateLanguage.FRC(), NZNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.PH(), CreateLanguage.FRC(), PHNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.PL(), CreateLanguage.FRC(), PLNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.PT(), CreateLanguage.FRC(), PTNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.RO(), CreateLanguage.FRC(), RONameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.RS(), CreateLanguage.FRC(), RSNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.RU(), CreateLanguage.FRC(), RUNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.SA(), CreateLanguage.FRC(), SANameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.SB(), CreateLanguage.FRC(), SBNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.SE(), CreateLanguage.FRC(), SENameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.SG(), CreateLanguage.FRC(), SGNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.SI(), CreateLanguage.FRC(), SINameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.SK(), CreateLanguage.FRC(), SKNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.SZ(), CreateLanguage.FRC(), SZNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.TH(), CreateLanguage.FRC(), THNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.TN(), CreateLanguage.FRC(), TNNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.TR(), CreateLanguage.FRC(), TRNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.TZ(), CreateLanguage.FRC(), TZNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.UG(), CreateLanguage.FRC(), UGNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.US(), CreateLanguage.FRC(), USNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.VU(), CreateLanguage.FRC(), VUNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.WS(), CreateLanguage.FRC(), WSNameLbl);
        ContosoCATranslation.InsertCountryRegionTranslation(CreateCountryRegion.ZA(), CreateLanguage.FRC(), ZANameLbl);
    end;

    var
        AENameLbl: Label 'Emirats arabes unis', MaxLength = 50;
        ATNameLbl: Label 'Autriche', MaxLength = 50;
        AUNameLbl: Label 'Australie', MaxLength = 50;
        BENameLbl: Label 'Belgique', MaxLength = 50;
        BGNameLbl: Label 'Bulgarie', MaxLength = 50;
        BNNameLbl: Label 'Brun´Š¢i Darussalam', MaxLength = 50;
        BRNameLbl: Label 'Br´Š¢sil', MaxLength = 50;
        CANameLbl: Label 'Canada', MaxLength = 50;
        CHNameLbl: Label 'Suisse', MaxLength = 50;
        CNNameLbl: Label 'Chine', MaxLength = 50;
        CYNameLbl: Label 'Chypre', MaxLength = 50;
        CZNameLbl: Label 'R´Š¢publique tch´Š¢que', MaxLength = 50;
        DENameLbl: Label 'Allemagne', MaxLength = 50;
        DKNameLbl: Label 'Danemark', MaxLength = 50;
        DZNameLbl: Label 'Alg´Š¢rie', MaxLength = 50;
        EENameLbl: Label 'Estonie', MaxLength = 50;
        ELNameLbl: Label 'Gr´Š¢ce', MaxLength = 50;
        ESNameLbl: Label 'Espagne', MaxLength = 50;
        FINameLbl: Label 'Finlande', MaxLength = 50;
        FJNameLbl: Label 'R´Š¢publique des ´Š¢les de Fidji', MaxLength = 50;
        FRNameLbl: Label 'France', MaxLength = 50;
        GBNameLbl: Label 'Royaume-Uni', MaxLength = 50;
        HRNameLbl: Label 'Croatie', MaxLength = 50;
        HUNameLbl: Label 'Hongrie', MaxLength = 50;
        IDNameLbl: Label 'Indon´Š¢sie', MaxLength = 50;
        IENameLbl: Label 'Irlande', MaxLength = 50;
        INNameLbl: Label 'Inde', MaxLength = 50;
        ISNameLbl: Label 'Islande', MaxLength = 50;
        ITNameLbl: Label 'Italie', MaxLength = 50;
        JPNameLbl: Label 'Japon', MaxLength = 50;
        KENameLbl: Label 'Kenya', MaxLength = 50;
        LTNameLbl: Label 'Lituanie', MaxLength = 50;
        LUNameLbl: Label 'Luxembourg', MaxLength = 50;
        LVNameLbl: Label 'Lettonie', MaxLength = 50;
        MANameLbl: Label 'Maroc', MaxLength = 50;
        MENameLbl: Label 'Mont´Š¢n´Š¢gro', MaxLength = 50;
        MTNameLbl: Label 'Malte', MaxLength = 50;
        MXNameLbl: Label 'Mexique', MaxLength = 50;
        MYNameLbl: Label 'Malaisie', MaxLength = 50;
        MZNameLbl: Label 'Mozambique', MaxLength = 50;
        NGNameLbl: Label 'Nigeria', MaxLength = 50;
        NLNameLbl: Label 'Pays-Bas', MaxLength = 50;
        NONameLbl: Label 'Norv´Š¢ge', MaxLength = 50;
        NZNameLbl: Label 'Nouvelle-Z´Š¢lande', MaxLength = 50;
        PHNameLbl: Label 'Philippines', MaxLength = 50;
        PLNameLbl: Label 'Pologne', MaxLength = 50;
        PTNameLbl: Label 'Portugal', MaxLength = 50;
        RONameLbl: Label 'Roumanie', MaxLength = 50;
        RSNameLbl: Label 'Serbie', MaxLength = 50;
        RUNameLbl: Label 'Russie', MaxLength = 50;
        SANameLbl: Label 'Arabie Saoudite', MaxLength = 50;
        SBNameLbl: Label '´Š¢les Salomon', MaxLength = 50;
        SENameLbl: Label 'Su´Š¢de', MaxLength = 50;
        SGNameLbl: Label 'Singapour', MaxLength = 50;
        SINameLbl: Label 'Slov´Š¢nie', MaxLength = 50;
        SKNameLbl: Label 'Slovaquie', MaxLength = 50;
        SZNameLbl: Label 'Swaziland', MaxLength = 50;
        THNameLbl: Label 'Tha´Š¢lande', MaxLength = 50;
        TNNameLbl: Label 'Tunisie', MaxLength = 50;
        TRNameLbl: Label 'Turquie', MaxLength = 50;
        TZNameLbl: Label 'Tanzanie', MaxLength = 50;
        UGNameLbl: Label 'Ouganda', MaxLength = 50;
        USNameLbl: Label 'Etats-Unis', MaxLength = 50;
        VUNameLbl: Label 'Vanuatu', MaxLength = 50;
        WSNameLbl: Label '´Š¢tat ind´Š¢pendant du Samoa', MaxLength = 50;
        ZANameLbl: Label 'Afrique du Sud', MaxLength = 50;
}
