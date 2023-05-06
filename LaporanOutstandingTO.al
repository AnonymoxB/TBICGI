report 60512 LaporanOutstandingTO
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Laporan Outstanding TO';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/LaporanOutstandingTO.rdl';

    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            column(No_; "No.")
            { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            { }
            column(Transfer_from_Code; "Transfer-from Code")
            { }
            column(Transfer_from_Name; "Transfer-from Name")
            { }
            column(Transfer_from_Address; "Transfer-from Address")
            { }
            column(Transfer_from_City; "Transfer-from City")
            { }
            column(Transfer_from_Contact; "Transfer-from Contact")
            { }
            column(Transfer_from_Post_Code; "Transfer-from Post Code")
            { }
            column(Trsf__from_Country_Region_Code; "Trsf.-from Country/Region Code")
            { }
            column(Transfer_to_Code; "Transfer-to Code")
            { }
            column(Transfer_to_Name; "Transfer-to Name")
            { }
            column(Transfer_to_Address; "Transfer-to Address")
            { }
            column(Transfer_to_City; "Transfer-to City")
            { }
            column(Transfer_to_Contact; "Transfer-to Contact")
            { }
            column(Transfer_to_Post_Code; "Transfer-to Post Code")
            { }
            column(Trsf__to_Country_Region_Code; "Trsf.-to Country/Region Code")
            { }
            column(Direct_Transfer; "Direct Transfer")
            { }
            column(In_Transit_Code; "In-Transit Code")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Shipment_Date; "Shipment Date")
            { }
            column(Receipt_Date; "Receipt Date")
            { }
            column(Status; Status)
            { }
            column(No__Series; "No. Series")
            { }
            column(Transaction_Type; "Transaction Type")
            { }
            column(Shipping_Advice; "Shipping Advice")
            { }
            column("Area"; "Area")
            { }
            column(Dimension_Set_ID; "Dimension Set ID")
            { }
            column(Outbound_Whse__Handling_Time; "Outbound Whse. Handling Time")
            { }
            column(Shipping_Agent_Code; "Shipping Agent Code")
            { }
            column(Shipping_Agent_Service_Code; "Shipping Agent Service Code")
            { }
            column(CompanyPic; CompanyInfo.Picture)
            { }
            dataitem("Transfer Line"; "Transfer Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Line_No_; "Line No.")
                { }
                column(Item_No_; "Item No.")
                { }
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_of_Measure; "Unit of Measure")
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
                column(Qty__to_Ship; "Qty. to Ship")
                { }
                column(Qty__to_Receive; "Qty. to Receive")
                { }
                column(Quantity_Shipped; "Quantity Shipped")
                { }
                column(Quantity_Received; "Quantity Received")
                { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                { }
                column(Inventory_Posting_Group; "Inventory Posting Group")
                { }
                column(Quantity__Base_; "Quantity (Base)")
                { }
                column(Outstanding_Qty___Base_; "Outstanding Qty. (Base)")
                { }
                column(Qty__to_Ship__Base_; "Qty. to Ship (Base)")
                { }
                column(Qty__Shipped__Base_; "Qty. Shipped (Base)")
                { }
                column(Qty__to_Receive__Base_; "Qty. to Receive (Base)")
                { }
                column(Qty__Received__Base_; "Qty. Received (Base)")
                { }
                column(Qty__per_Unit_of_Measure; "Qty. per Unit of Measure")
                { }
                column(Outstanding_Quantity; "Outstanding Quantity")
                { }
                column(Gross_Weight; "Gross Weight")
                { }
                column(Net_Weight; "Net Weight")
                { }
                column(Unit_Volume; "Unit Volume")
                { }
                column(Qty__Rounding_Precision; "Qty. Rounding Precision")
                { }
                column(Qty__Rounding_Precision__Base_; "Qty. Rounding Precision (Base)")
                { }
                column(Variant_Code; "Variant Code")
                { }
                column(Units_per_Parcel; "Units per Parcel")
                { }
                column(Qty__in_Transit; "Qty. in Transit")
                { }
                column(Qty__in_Transit__Base_; "Qty. in Transit (Base)")
                { }
                column(Reserved_Quantity_Inbnd_; "Reserved Quantity Inbnd.")
                { }
                column(Reserved_Quantity_Outbnd_; "Reserved Quantity Outbnd.")
                { }
                column(Reserved_Quantity_Shipped; "Reserved Quantity Shipped")
                { }
            }
        }
    }
    requestpage
    {
        SaveValues = true;
    }
    trigger OnInitReport();
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}