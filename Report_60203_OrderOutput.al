report 60203 OrderOutput
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Order Output';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_60203_OrderOutput.rdl';

    dataset
    {
        dataitem("Invt. Document Header"; "Invt. Document Header")
        {
            column(Document_Type; "Document Type")
            {
            }
            column(No_; "No.")
            { }
            column(Posting_Description; "Posting Description")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
            { }
            column(Salesperson_Purchaser_Code; "Salesperson/Purchaser Code")
            { }
            column(External_Document_No_; "External Document No.")
            { }
            column(Correction; Correction)
            { }
            column(No__Series; "No. Series")
            { }
            column(Posting_No__Series; "Posting No. Series")
            { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            { }
            column(Dimension_Set_ID; "Dimension Set ID")
            { }
            column(Location_Code; "Location Code")
            { }
            column(Status; Status)
            { }
            column(CompanyPic; CompanyInfo.Picture)
            { }
            dataitem("Invt. Document Line"; "Invt. Document Line")
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
                column(Unit_Amount; "Unit Amount")
                { }
                column(Indirect_Cost__; "Indirect Cost %")
                { }
                column(Unit_Cost; "Unit Cost")
                { }
                column(Amount; Amount)
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
                column(Inventory_Posting_Group; "Inventory Posting Group")
                { }
                column(Applies_to_Entry; "Applies-to Entry")
                { }
                column(Qty__per_Unit_of_Measure; "Qty. per Unit of Measure")
                { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                { }
                column(Variant_Code; "Variant Code")
                { }
                column(Gross_Weight; "Gross Weight")
                { }
                column(Net_Weight; "Net Weight")
                { }
                column(Units_per_Parcel; "Units per Parcel")
                { }
            }
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