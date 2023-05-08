report 60301 PermintaanPembayaran
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Permintaan Pembayaran';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_60301_PP.rdl';

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            column(Posting_Date; "Posting Date") { }
            column(Document_No_; "Document No.") { }
            column(Account_No_; "Account No.") { }
            column(Description; Description) { }
            column(Amount; Amount) { }
            column(Amount__LCY_; "Amount (LCY)") { }
            column(Applies_to_ID; "Applies-to ID") { }
            column(Applies_to_Doc__No_; "Applies-to Doc. No.") { }
            column(Journal_Batch_Name; "Journal Batch Name") { }
            column(Currency_Code; "Currency Code") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Journal Batch Name" = field("Journal Batch Name");
                column(Document_No_VLE; "Document No.") { }
                column(Vendor_Name; "Vendor Name") { }
                column(Vendor_No_; "Vendor No.") { }
                column(Document_Date; "Document Date") { }
                column(Due_Date; "Due Date") { }
                column(Codebank; Codebank) { }
                column(NoRek; NoRek) { }
                trigger OnAfterGetRecord()
                var
                    xVendorBank: Record "Vendor Bank Account";
                begin
                    xVendorBank.SetRange("Vendor No.", "Vendor Ledger Entry"."Vendor No.");
                    if xVendorBank.FindFirst() then begin
                        CodeBank := xVendorBank.Code;
                        NoRek := xVendorBank."Bank Account No.";
                    end
                end;
            }
        }
    }
    requestpage
    {
        SaveValues = true;
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        Codebank: Code[20];
        NoRek: Text;
}