report 60305 PaymentRequestStatus
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Payment Request Status';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/PaymentRequestStatus.rdl';

    dataset
    {
        dataitem("Gen. Journal Batch"; "Gen. Journal Batch")
        {
            column(Journal_Template_Name; "Journal Template Name") { }
            column(Name; Name) { }
            column(Bal__Account_No_; "Bal. Account No.") { }
            column(Bal__Account_Type; "Bal. Account Type") { }
            column(No__Series; "No. Series") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Gen. Journal Line"; "Gen. Journal Line")
            {
                DataItemLink = "Journal Template Name" = field("Journal Template Name");
                column(Line_No_; "Line No.") { }
                column(Account_Type; "Account Type") { }
                column(Bill_to_Pay_to_No_; "Bill-to/Pay-to No.") { }
                column(Document_No_; "Document No.") { }
                column(Document_Date; "Document Date") { }
                column(Document_Type; "Document Type") { }
                column(Posting_Date; "Posting Date") { }
                column(Account_No_; "Account No.") { }
                column(Description; Description) { }
                dataitem("Payment Jnl. Export Error Text"; "Payment Jnl. Export Error Text")
                {
                    DataItemLink = "Document No." = field("Document No.");
                    column(Error_Text; "Error Text") { }
                }
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