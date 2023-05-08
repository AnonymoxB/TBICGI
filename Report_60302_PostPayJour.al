report 60302 PostedPaymentJournal
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Posted Payment Journal';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/Rdlc_60302_PostPayJour.rdl';

    dataset
    {
        dataitem("Posted Gen. Journal Line"; "Posted Gen. Journal Line")
        {
            column(Line_No_; "Line No.") { }
            column(Account_Type; "Account Type") { }
            column(Account_No_; "Account No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Document_Type; "Document Type") { }
            column(Document_No_; "Document No.") { }
            column(Description; Description) { }
            column(VAT__; "VAT %") { }
            column(Currency_Code; "Currency Code") { }
            column(Amount; Amount) { }
            column(Debit_Amount; "Debit Amount") { }
            column(Credit_Amount; "Credit Amount") { }
            column(Amount__LCY_; "Amount (LCY)") { }
            column(Balance__LCY_; "Balance (LCY)") { }
            column(Currency_Factor; "Currency Factor") { }
            column(Sales_Purch___LCY_; "Sales/Purch. (LCY)") { }
            column(Profit__LCY_; "Profit (LCY)") { }
            column(Inv__Discount__LCY_; "Inv. Discount (LCY)") { }
            column(Bill_to_Pay_to_No_; "Bill-to/Pay-to No.") { }
            column(Posting_Group; "Posting Group") { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
            column(Salespers__Purch__Code; "Salespers./Purch. Code") { }
            column(Source_Code; "Source Code") { }
            column(System_Created_Entry; "System-Created Entry") { }
            column(Applies_to_Doc__Type; "Applies-to Doc. Type") { }
            column(Applies_to_Doc__No_; "Applies-to Doc. No.") { }
            column(Due_Date; "Due Date") { }
            column(Document_Date; "Document Date") { }
            column(Payment_Discount__; "Payment Discount %") { }
            column(Quantity; Quantity) { }
            column(VAT_Amount; "VAT Amount") { }
            column(VAT_Posting; "VAT Posting") { }
            column(Payment_Terms_Code; "Payment Terms Code") { }
            column(Applies_to_ID; "Applies-to ID") { }
            column(Business_Unit_Code; "Business Unit Code") { }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group") { }
            column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
            column(Source_Currency_Code; "Source Currency Code") { }
            column(Reversing_Entry; "Reversing Entry") { }
            column(G_L_Register_No_; "G/L Register No.") { }
            column(Bal__Account_Type; "Bal. Account Type") { }
            column(Bal__Account_No_; "Bal. Account No.") { }
            column(CompanyPic; CompanyInfo.Picture) { }
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
}