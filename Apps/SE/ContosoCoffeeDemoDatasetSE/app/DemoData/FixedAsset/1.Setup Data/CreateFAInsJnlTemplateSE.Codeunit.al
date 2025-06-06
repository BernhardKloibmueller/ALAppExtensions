// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace Microsoft.DemoData.FixedAsset;

using Microsoft.DemoTool.Helpers;

codeunit 11243 "Create FA Ins Jnl. Template SE"
{
    InherentEntitlements = X;
    InherentPermissions = X;

    trigger OnRun()
    var
        ContosoFixedAsset: Codeunit "Contoso Fixed Asset";
        CreateFANoSeries: Codeunit "Create FA No Series";
        CreateFAInsJnlTemplate: Codeunit "Create FA Ins Jnl. Template";
    begin
        ContosoFixedAsset.SetOverwriteData(true);
        ContosoFixedAsset.InsertInsuranceJournalTemplate(CreateFAInsJnlTemplate.Insurance(), InsuranceJournalLbl, CreateFANoSeries.InsuranceJournal());
        ContosoFixedAsset.InsertInsuranceJournalBatch(CreateFAInsJnlTemplate.Insurance(), CreateFAInsJnlTemplate.Default(), DefaultJournalBatchLbl);
        ContosoFixedAsset.SetOverwriteData(false);
    end;

    var
        InsuranceJournalLbl: Label 'Insurance Journal', MaxLength = 50;
        DefaultJournalBatchLbl: Label 'Default Journal Batch', MaxLength = 50;
}
