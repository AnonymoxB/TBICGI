report 60505 PCMSesuaiBisnisUnit
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'PCM Sesuai Bisnis Unit';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/Rdlc_60505_PCMSesuaiBU.rdl';

    dataset
    {
        dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
        {
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.") { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_City; "Pay-to City") { }
            column(Pay_to_Post_Code; "Pay-to Post Code") { }
            column(Posting_Date; "Posting Date") { }
            column(VAT_Reporting_Date; "VAT Reporting Date") { }
            column(Document_Date; "Document Date") { }
            column(Pre_Assigned_No_; "Pre-Assigned No.") { }
            column(Vendor_Cr__Memo_No_; "Vendor Cr. Memo No.") { }
            column(Purchaser_Code; "Purchaser Code") { }
            column(Cancelled; Cancelled) { }
            column(Corrective; Corrective) { }
            column(No_; "No.") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
            {
                column(Document_No_; "Document No.") { }
                column(Type; Type) { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Unit_Price__LCY_; "Unit Price (LCY)") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Line_Amount; "Line Amount") { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                column(VAT__; "VAT %") { }
                column(Amount; Amount) { }
                column(Amount_Including_VAT; "Amount Including VAT") { }
            }
        }

    }
    requestpage
    {
        SaveValues = true;
    }

    trigger OnInitReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}