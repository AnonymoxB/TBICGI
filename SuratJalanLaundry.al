report 60401 SuratJalanLaundry
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Surat Jalan Laundry';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/SuratJalanLaundry.rdl';

    dataset
    {
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            column(No_; "No.") { }
            column(Transfer_from_Code; "Transfer-from Code") { }
            column(Transfer_from_Name; "Transfer-from Name") { }
            column(Transfer_from_Address; "Transfer-from Address") { }
            column(Transfer_to_Code; "Transfer-to Code") { }
            column(Transfer_to_Name; "Transfer-to Name") { }
            column(Transfer_to_Address; "Transfer-to Address") { }
            column(Direct_Transfer; "Direct Transfer") { }
            column(In_Transit_Code; "In-Transit Code") { }
            column(Transfer_Order_No_; "Transfer Order No.") { }
            column(Transfer_Order_Date; "Transfer Order Date") { }
            column(Posting_Date; "Posting Date") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Quantity__Base_; "Quantity (Base)") { }
                column(Qty__per_Unit_of_Measure; "Qty. per Unit of Measure") { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Shipping_Time; "Shipping Time") { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
                column(Inventory_Posting_Group; "Inventory Posting Group") { }
                column(Shipment_Date; "Shipment Date") { }
                column(Shipping_Agent_Code; "Shipping Agent Code") { }
                column(Shipping_Agent_Service_Code; "Shipping Agent Service Code") { }
                column(Item_Shpt__Entry_No_; "Item Shpt. Entry No.") { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                column(Line_No_; "Line No.") { }
                column(Gross_Weight; "Gross Weight") { }
                column(Net_Weight; "Net Weight") { }
                column(Unit_Volume; "Unit Volume") { }
                column(Variant_Code; "Variant Code") { }
                column(Units_per_Parcel; "Units per Parcel") { }
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