report 60410 PostedWarehouseShipment
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Posted Warehouse Shipment';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/PostedWarehouseShipment.rdl';

    dataset
    {
        dataitem("Posted Whse. Shipment Header"; "Posted Whse. Shipment Header")
        {
            column(No_; "No.") { }
            column(Location_Code; "Location Code") { }
            column(Assigned_User_ID; "Assigned User ID") { }
            column(Assignment_Date; "Assignment Date") { }
            column(Assignment_Time; "Assignment Time") { }
            column(No__Series; "No. Series") { }
            column(Comment; Comment) { }
            column(Bin_Code; "Bin Code") { }
            column(Zone_Code; "Zone Code") { }
            column(Posting_Date; "Posting Date") { }
            column(Shipment_Date; "Shipment Date") { }
            column(Shipping_Agent_Code; "Shipping Agent Code") { }
            column(Shipping_Agent_Service_Code; "Shipping Agent Service Code") { }
            column(Shipment_Method_Code; "Shipment Method Code") { }
            column(Whse__Shipment_No_; "Whse. Shipment No.") { }
            column(External_Document_No_; "External Document No.") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Posted Whse. Shipment Line"; "Posted Whse. Shipment Line")
            {
                column(Line_No_; "Line No.") { }
                column(Source_Type; "Source Type") { }
                column(Source_Subtype; "Source Subtype") { }
                column(Source_No_; "Source No.") { }
                column(Source_Line_No_; "Source Line No.") { }
                column(Source_Document; "Source Document") { }
                column(Shelf_No_; "Shelf No.") { }
                column(Item_No_; "Item No.") { }
                column(Quantity; Quantity) { }
                column(Qty___Base_; "Qty. (Base)") { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Qty__per_Unit_of_Measure; "Qty. per Unit of Measure") { }
                column(Variant_Code; "Variant Code") { }
                column(Description; Description) { }
                column(Due_Date; "Due Date") { }
                column(Destination_Type; "Destination Type") { }
                column(Destination_No_; "Destination No.") { }
                column(Shipping_Advice; "Shipping Advice") { }
                column(Qty__Rounding_Precision; "Qty. Rounding Precision") { }
                column(Qty__Rounding_Precision__Base_; "Qty. Rounding Precision (Base)") { }
                column(Posted_Source_Document; "Posted Source Document") { }
                column(Posted_Source_No_; "Posted Source No.") { }
                column(Whse_Shipment_Line_No_; "Whse Shipment Line No.") { }
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