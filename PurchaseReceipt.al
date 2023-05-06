report 60509 PurchaseReceipt
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Daily Receipt Report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/PurchaseReceipt.rdl';

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            RequestFilterFields = "Buy-from Vendor No.", "Order Date", "Location Code";
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Buy_from_Contact; "Buy-from Contact") { }
            column(Buy_from_Contact_No_; "Buy-from Contact No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Buy_from_Address; "Buy-from Address") { }
            column(Buy_from_City; "Buy-from City") { }
            column(Buy_from_Post_Code; "Buy-from Post Code") { }
            column(Buy_from_Country_Region_Code; "Buy-from Country/Region Code") { }
            column(No__Printed; "No. Printed") { }
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.") { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_Contact; "Pay-to Contact") { }
            column(Pay_to_Contact_no_; "Pay-to Contact no.") { }
            column(Pay_to_Country_Region_Code; "Pay-to Country/Region Code") { }
            column(Pay_to_Post_Code; "Pay-to Post Code") { }
            column(Pay_to_City; "Pay-to City") { }
            column(Ship_to_Code; "Ship-to Code") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Post_Code; "Ship-to Post Code") { }
            column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code") { }
            column(Ship_to_Contact; "Ship-to Contact") { }
            column(Posting_Date; "Posting Date") { }
            column(Document_Date; "Document Date") { }
            column(Requested_Receipt_Date; "Requested Receipt Date") { }
            column(Promised_Receipt_Date; "Promised Receipt Date") { }
            column(Order_Date; "Order Date") { }
            column(Quote_No_; "Quote No.") { }
            column(Order_No_; "Order No.") { }
            column(Your_Reference; "Your Reference") { }
            column(Posting_Description; "Posting Description") { }
            column(Payment_Terms_Code; "Payment Terms Code") { }
            column(Due_Date; "Due Date") { }
            column(Purchaser_Code; "Purchaser Code") { }
            column(Vendor_Order_No_; "Vendor Order No.") { }
            column(Vendor_Shipment_No_; "Vendor Shipment No.") { }
            column(Vendor_Posting_Group; "Vendor Posting Group") { }
            column(Shipment_Method_Code; "Shipment Method Code") { }
            column(Payment_Discount__; "Payment Discount %") { }
            column(Jml; TotalHarga) { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Document_No_; "Document No.") { }
                column(No_; "No.") { }
                column(Line_No_; "Line No.") { }
                column(Type; Type) { }
                column(Description; Description) { }
                column(Location_Code; "Location Code") { }
                column(Posting_Group; "Posting Group") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Quantity_Invoiced; "Quantity Invoiced") { }
                column(Planned_Receipt_Date; "Planned Receipt Date") { }
                column(Expected_Receipt_Date; "Expected Receipt Date") { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Unit_Cost__LCY_; "Unit Cost (LCY)") { }
                column(Unit_Price__LCY_; "Unit Price (LCY)") { }
                column(Currency_Code; "Currency Code") { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }

                trigger OnAfterGetRecord()
                begin
                    TotalHarga := Quantity * "Direct Unit Cost";
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
        TotalHarga: Decimal;
}