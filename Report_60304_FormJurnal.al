report 60304 FormJurnalAcc
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Journal Form';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_60304_FormJurnal.rdl';

    dataset
    {
        dataitem("Posted Gen. Journal Line"; "Posted Gen. Journal Line")
        {
            column(Journal_Template_Name; "Journal Template Name") { }
            column(Account_Type; "Account Type") { }
            column(Account_No_; "Account No.") { }
            column(Document_Type; "Document Type") { }
            column(Document_No_; "Document No.") { }
            column(Amount; Amount) { }
            column(Debit_Amount; "Debit Amount") { }
            column(Credit_Amount; "Credit Amount") { }
            column(Amount__LCY_; "Amount (LCY)") { }
            column(Due_Date; "Due Date") { }
            column(Document_Date; "Document Date") { }
            column(Posting_Date; "Posting Date") { }
            column(Applies_to_ID; "Applies-to ID") { }
            column(Journal_Batch_Name; "Journal Batch Name") { }
            column(Description; Description) { }
            column(Comment; Comment) { }
            column(CompanyPic; CompanyInfo.Picture) { }
        }
    }
    requestpage
    {
        SaveValues = true;
    }
    trigger OnInitReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";

}