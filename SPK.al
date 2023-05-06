report 60201 SPK
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'SPK';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/SPK.rdl';

    dataset
    {
        dataitem("Requisition Wksh. Name"; "Requisition Wksh. Name")
        {
            column(Worksheet_Template_Name; "Worksheet Template Name") { }
            column(Name; Name) { }
            column(Template_Type; "Template Type") { }
            column(Recurring; Recurring) { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Requisition Line"; "Requisition Line")
            {
                column(Journal_Batch_Name; "Journal Batch Name") { }
                column(Line_No_; "Line No.") { }
                column(Type; Type) { }
                column(Description; Description) { }
                column(No_; "No.") { }
                column(Quantity; Quantity) { }
                column(Vendor_No_; "Vendor No.") { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Confirmed; Confirmed) { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                column(Location_Code; "Location Code") { }
                column(Action_Message; "Action Message") { }
                column(Due_Date; "Due Date") { }
                column(Starting_Date_Time; "Starting Date-Time") { }
                column(Ending_Date_Time; "Ending Date-Time") { }
                column(Accept_Action_Message; "Accept Action Message") { }
                column(Order_Date; "Order Date") { }
                column(Original_Quantity; "Original Quantity") { }
                column(Ref__Order_Type; "Ref. Order Type") { }
                column(Ref__Order_No_; "Ref. Order No.") { }
                column(Ref__Order_Status; "Ref. Order Status") { }
                column(Vendor_Item_No_; "Vendor Item No.") { }
                column(Sales_Order_No_; "Sales Order No.") { }
                column(Currency_Code; "Currency Code") { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Dimension_Set_ID; "Dimension Set ID") { }
                column(Prod__Order_No_; "Prod. Order No.") { }
                column(Variant_Code; "Variant Code") { }
                column(Bin_Code; "Bin Code") { }
                column(Qty__per_Unit_of_Measure; "Qty. per Unit of Measure") { }
                column(Reserve; Reserve) { }
                column(Supply_From; "Supply From") { }
                column(Nonstock; Nonstock) { }
                column(Price_Calculation_Method; "Price Calculation Method") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
                column(Gen__Business_Posting_Group; "Gen. Business Posting Group") { }
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