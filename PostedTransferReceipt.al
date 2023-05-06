report 60508 PostedTransferReceipt
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Posted Transfer Receipt';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/PostedTransferReceipt.rdl';

    dataset
    {
        dataitem("Transfer Receipt Header"; "Transfer Receipt Header")
        {
            column(No_; "No.") { }
            column(Transfer_from_Code; "Transfer-from Code") { }
            column(Transfer_from_Name; "Transfer-from Name") { }
            column(Transfer_from_Address; "Transfer-from Address") { }
            column(Transfer_from_Post_Code; "Transfer-from Post Code") { }
            column(Transfer_from_City; "Transfer-from City") { }
            column(Trsf__from_Country_Region_Code; "Trsf.-from Country/Region Code") { }
            column(Transfer_from_Contact; "Transfer-from Contact") { }
            column(Transfer_to_Code; "Transfer-to Code") { }
            column(Transfer_to_Name; "Transfer-to Name") { }
            column(Transfer_to_Address; "Transfer-to Address") { }
            column(Transfer_to_City; "Transfer-to City") { }
            column(Transfer_to_Post_Code; "Transfer-to Post Code") { }
            column(Transfer_to_Contact; "Transfer-to Contact") { }
            column(Trsf__to_Country_Region_Code; "Trsf.-to Country/Region Code") { }
            column(Direct_Transfer; "Direct Transfer") { }
            column(In_Transit_Code; "In-Transit Code") { }
            column(Transfer_Order_No_; "Transfer Order No.") { }
            column(Transfer_Order_Date; "Transfer Order Date") { }
            column(Posting_Date; "Posting Date") { }
            column(Shipment_Date; "Shipment Date") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Transfer Receipt Line"; "Transfer Receipt Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Shipping_Time; "Shipping Time") { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
                column(Inventory_Posting_Group; "Inventory Posting Group") { }
                column(Shipping_Agent_Code; "Shipping Agent Code") { }
                column(Shipping_Agent_Service_Code; "Shipping Agent Service Code") { }
                column(Receipt_Date; "Receipt Date") { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
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