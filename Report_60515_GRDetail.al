report 60515 GoodReceiveDetail
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Good Receive Form';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/GoodReceiveDetail.rdl';

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(No_; "No.") { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_City; "Pay-to City") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Order_Date; "Order Date") { }
            column(Posting_Date; "Posting Date") { }
            column(Document_Date; "Document Date") { }
            column(Due_Date; "Due Date") { }
            column(Order_No_; "Order No.") { }
            column(Transaction_Type; "Transaction Type") { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
            column(Purchaser_Code; "Purchaser Code") { }
            column(PurhcName; PurhcName) { }
            column(Vendor_Shipment_No_; "Vendor Shipment No.") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Line_No_; "Line No.") { }
                column(Type; Type) { }
                column(No_Line; "No.") { }
                column(Description; Description) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Quantity; Quantity) { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Location_Code; "Location Code") { }
                column(xloc; xloc) { }
                column(Currency_Code; "Currency Code") { }
                column(AmountTot; AmountTot) { }

                trigger OnAfterGetRecord()
                var
                    xLocation: Record Location;
                begin
                    xLocation.SetRange(Code, "Purch. Rcpt. Line"."Location Code");
                    if xLocation.FindFirst() then
                        xloc := xLocation.Name;
                    AmountTot := Quantity * "Direct Unit Cost";
                end;
            }
            trigger OnAfterGetRecord()
            var
                xSalesPerson: Record "Salesperson/Purchaser";
            begin
                xSalesPerson.SetRange(Code, "Purch. Rcpt. Header"."Purchaser Code");
                if xSalesPerson.FindFirst() then
                    PurhcName := xSalesPerson.Name;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
    }

    trigger OnInitReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        myInt: Integer;
        PurhcName, xloc : Text;
        AmountTot: Decimal;
        CompanyInfo: Record "Company Information";
}