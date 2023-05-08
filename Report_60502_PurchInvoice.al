report 60502 PurchaseInvoice
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Purchase Invoice';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_60502_PurchInvoice.rdl';

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            column(Posting_Description; "Posting Description") { }
            column(No_; "No.") { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Buy_from_Address; "Buy-from Address") { }
            column(Buy_from_Post_Code; "Buy-from Post Code") { }
            column(Buy_from_Country_Region_Code; "Buy-from Country/Region Code") { }
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.") { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_City; "Pay-to City") { }
            column(Pay_to_Contact; "Pay-to Contact") { }
            column(Pay_to_Contact_No_; "Pay-to Contact No.") { }
            column(Pay_to_Post_Code; "Pay-to Post Code") { }
            column(Pay_to_Country_Region_Code; "Pay-to Country/Region Code") { }
            column(Posting_Date; "Posting Date") { }
            column(VAT_Reporting_Date; "VAT Reporting Date") { }
            column(Due_Date; "Due Date") { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.") { }
            column(Ship_to_Code; "Ship-to Code") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Contact; "Ship-to Contact") { }
            column(Order_Date; "Order Date") { }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group") { }
            column(Document_Date; "Document Date") { }
            column(Bal__Account_Type; "Bal. Account Type") { }
            column(Currency_Code; "Currency Code") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            column(NoRek; NoRek) { }
            column(Codebank; Codebank) { }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Type; Type) { }
                column(Document_No_; "Document No.") { }
                column(Description; Description) { }
                column(Location_Code; "Location Code") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Line_Amount; "Line Amount") { }
                column(Unit_Cost__LCY_; "Unit Cost (LCY)") { }
                column(VAT__; "VAT %") { }
                column(Line_Discount_Amount; "Line Discount Amount") { }
                column(Amount; Amount) { }
                column(Amount_Including_VAT; "Amount Including VAT") { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                column("Area"; "Area") { }
                column(Tax_Area_Code; "Tax Area Code") { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
                column(Expected_Receipt_Date; "Expected Receipt Date") { }
                column(VAT_Bus__Posting_Group; "VAT Bus. Posting Group") { }
            }
            trigger OnAfterGetRecord()
            var
                xVendorBank: Record "Vendor Bank Account";
            begin
                xVendorBank.SetRange("Vendor No.", "Purch. Inv. Header"."Pay-to Vendor No.");
                if xVendorBank.FindFirst() then begin
                    CodeBank := xVendorBank.Code;
                    NoRek := xVendorBank."Bank Account No.";
                end
            end;
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