report 60104 LaporanRealisasiMaintenance
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Laporan Realisasi Maintenance';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/LaporanRealisasiMaintenance.rdl';

    dataset
    {
        dataitem("DAM Work Order Ledger Entry"; "DAM Work Order Ledger Entry")
        {
            column(Posting_Date; "Posting Date")
            { }
            column(Asset_No_; "Asset No.")
            { }
            column(Work_Order_No_; "Work Order No.")
            { }
            column(Plan_No_; "Plan No.")
            { }
            column(Type; Type)
            { }
            column(No_; "No.")
            { }
            column(Description; Description)
            { }
            column(Quantity; Quantity)
            { }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            { }
            column(Location_Code; "Location Code")
            { }
            column(Work_Type_Code; "Work Type Code")
            { }
            column(Serial_No_; "Serial No.")
            { }
            column(Lot_No_; "Lot No.")
            { }
            column(Vendor_No_; "Vendor No.")
            { }
            column(Expected_Unit_Cost__LCY_; "Expected Unit Cost (LCY)")
            { }
            column(Expected_Line_Cost__LCY_; "Expected Line Cost (LCY)")
            { }
            column(Expense_Open; "Expense Open")
            { }
            column(Actual_Line_Cost__LCY_; "Actual Line Cost (LCY)")
            { }
            column(Entry_No_; "Entry No.")
            { }
            column(Direct_FA_Cost; "Direct FA Cost")
            { }
            column(Skills; Skills)
            { }
            column(Missing_Skills; "Missing Skills")
            { }
            column(CompanyPic; CompanyInfo.Picture)
            { }
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnInitReport();
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}