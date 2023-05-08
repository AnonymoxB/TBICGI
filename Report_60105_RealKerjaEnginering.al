report 60105 RealisasiPengerjaanEnginering
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Realisasi Pengerjaan Enginering';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_60105_RealKerjaEnginering.rdl';

    dataset
    {
        dataitem("Res. Ledger Entry"; "Res. Ledger Entry")
        {
            column(Entry_No_; "Entry No.") { }
            column(Entry_Type; "Entry Type") { }
            column(Document_No_; "Document No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Resource_No_; "Resource No.") { }
            column(Resource_Group_No_; "Resource Group No.") { }
            column(Description; Description) { }
            column(Work_Type_Code; "Work Type Code") { }
            column(Job_No_; "Job No.") { }
            column(Unit_of_Measure_Code; "Unit of Measure Code") { }
            column(Quantity; Quantity) { }
            column(Direct_Unit_Cost; "Direct Unit Cost") { }
            column(Unit_Cost; "Unit Cost") { }
            column(Total_Cost; "Total Cost") { }
            column(Unit_Price; "Unit Price") { }
            column(Total_Price; "Total Price") { }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code") { }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code") { }
            column(User_ID; "User ID") { }
            column(Source_Code; "Source Code") { }
            column(Chargeable; Chargeable) { }
            column(Journal_Batch_Name; "Journal Batch Name") { }
            column(Reason_Code; "Reason Code") { }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group") { }
            column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
            column(Document_Date; "Document Date") { }
            column(External_Document_No_; "External Document No.") { }
            column(No__Series; "No. Series") { }
            column(Source_Type; "Source Type") { }
            column(Source_No_; "Source No.") { }
            column(Qty__per_Unit_of_Measure; "Qty. per Unit of Measure") { }
            column(Quantity__Base_; "Quantity (Base)") { }
            column(Order_Type; "Order Type") { }
            column(Order_No_; "Order No.") { }
            column(Order_Line_No_; "Order Line No.") { }
            column(Dimension_Set_ID; "Dimension Set ID") { }
            column(Shortcut_Dimension_3_Code; "Shortcut Dimension 3 Code") { }
            column(Shortcut_Dimension_4_Code; "Shortcut Dimension 4 Code") { }
            column(CompanyPic; CompanyInfo.Picture) { }
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