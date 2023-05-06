report 60503 PurchaseReturnOrder
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Purchase Return Order';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/PurchaseReturnOrder.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(Document_Type; "Document Type") { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Document_Date; "Document Date") { }
            column(Vendor_Cr__Memo_No_; "Vendor Cr. Memo No.") { }
            column(Purchaser_Code; "Purchaser Code") { }
            column(Status; Status) { }
            column(Transaction_Type; "Transaction Type") { }
            column(Currency_Code; "Currency Code") { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
            column(Ship_to_Code; "Ship-to Code") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Buy_from_Address; "Buy-from Address") { }
            column(Buy_from_City; "Buy-from City") { }
            column(Buy_from_Post_Code; "Buy-from Post Code") { }
            column(Buy_from_Country_Region_Code; "Buy-from Country/Region Code") { }
            column(Posting_Date; "Posting Date") { }
            column(Order_Date; "Order Date") { }
            column(VAT_Reporting_Date; "VAT Reporting Date") { }
            column(No__of_Archived_Versions; "No. of Archived Versions") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Buy-from Vendor No." = field("Buy-from Vendor No.");
                column(Type; Type) { }
                column(Document_No_; "Document No.") { }
                column(No_; "No.") { }
                column(Description; Description) { }
                column(Location_Code; "Location Code") { }
                column(Quantity; Quantity) { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
                column(Return_Qty__Shipped; "Return Qty. Shipped") { }
                column(Qty__to_Invoice; "Qty. to Invoice") { }
                column(Quantity_Invoiced; "Quantity Invoiced") { }
                column(VAT__; "VAT %") { }
                column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group") { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
                column(Line_Discount__; "Line Discount %") { }
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

}