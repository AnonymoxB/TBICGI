report 60402 LaporanTurnover
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Laporan Turnover';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_60402_Turnover.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            column(Posting_Date; "Posting Date") { }
            column(Entry_Type; "Entry Type") { }
            column(Document_Type; "Document Type") { }
            column(Document_No_; "Document No.") { }
            column(Item_No_; "Item No.") { }
            column(Description; Description) { }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code") { }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code") { }
            column(Location_Code; "Location Code") { }
            column(Quantity; Quantity) { }
            column(Invoiced_Quantity; "Invoiced Quantity") { }
            column(Remaining_Quantity; "Remaining Quantity") { }
            column(Sales_Amount__Actual_; "Sales Amount (Actual)") { }
            column(Cost_Amount__Actual_; "Cost Amount (Actual)") { }
            column(Cost_Amount__Non_Invtbl__; "Cost Amount (Non-Invtbl.)") { }
            column(Open; Open) { }
            column(Order_Type; "Order Type") { }
            column(Entry_No_; "Entry No.") { }
            column(Document_Date; "Document Date") { }
            column(Document_Line_No_; "Document Line No.") { }
            column(Country_Region_Code; "Country/Region Code") { }
            column("Area"; "Area") { }
            column(Lot_No_; "Lot No.") { }
            column(CompanyPic; CompanyInfo.Picture) { }
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