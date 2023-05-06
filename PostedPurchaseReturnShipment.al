report 60504 PostedPurchaseReturnShipment
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Posted Purchase Return Shipment';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/PostedPurchaseReturnShipment.rdl';

    dataset
    {
        dataitem("Return Shipment Header"; "Return Shipment Header")
        {
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(No_; "No.") { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_City; "Pay-to City") { }
            column(Posting_Date; "Posting Date") { }
            column(Expected_Receipt_Date; "Expected Receipt Date") { }
            column(Due_Date; "Due Date") { }
            column(Document_Date; "Document Date") { }
            column(User_ID; "User ID") { }
            column(CompanyInfo; CompanyInfo.Picture) { }
            dataitem("Return Shipment Line"; "Return Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Type; Type) { }
                column(Document_No_; "Document No.") { }
                column(Line_No_; "Line No.") { }
                column(Description; Description) { }
                column(Location_Code; "Location Code") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Quantity_Invoiced; "Quantity Invoiced") { }
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