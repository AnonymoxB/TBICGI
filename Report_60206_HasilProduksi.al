report 60206 HasilProduksi
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Hasil Produksi';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_60206_HasilProduksi.rdl';

    dataset
    {
        dataitem("Invt. Receipt Header"; "Invt. Receipt Header")
        {
            column(No_; "No.")
            { }
            column(Posting_Description; "Posting Description")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Location_Code; "Location Code")
            { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            { }
            column(Purchaser_Code; "Purchaser Code")
            { }
            column(Comment; Comment)
            { }
            column(Language_Code; "Language Code")
            { }
            column(No__Series; "No. Series")
            { }
            column(Posting_No__Series; "Posting No. Series")
            { }
            column(External_Document_No_; "External Document No.")
            { }
            column(Posting_No_; "Posting No.")
            { }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
            { }
            column(Receipt_No_; "Receipt No.")
            { }
            column(No__Printed; "No. Printed")
            { }
            column(Correction; Correction)
            { }
            column(Dimension_Set_ID; "Dimension Set ID")
            { }
            column(CompanyPic; CompanyInfo.Picture)
            { }
            dataitem("Invt. Receipt Line"; "Invt. Receipt Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Line_No_; "Line No.")
                { }
                column(Item_No_; "Item No.")
                { }
                column(Description; Description)
                { }
                column(Inventory_Posting_Group; "Inventory Posting Group")
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_Amount; "Unit Amount")
                { }
                column(Unit_Cost; "Unit Cost")
                { }
                column(Amount; Amount)
                { }
                column(Salespers__Purch__Code; "Salespers./Purch. Code")
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
                column(Gross_Weight; "Gross Weight")
                { }
                column(Net_Weight; "Net Weight")
                { }
                column(Units_per_Parcel; "Units per Parcel")
                { }
                column(Unit_Volume; "Unit Volume")
                { }
                column(Source_Code; "Source Code")
                { }
                column(Applies_to_Entry; "Applies-to Entry")
                { }
                column(Item_Rcpt__Entry_No_; "Item Rcpt. Entry No.")
                { }
                column(Indirect_Cost__; "Indirect Cost %")
                { }
                column(Reason_Code; "Reason Code")
                { }
                column(Last_Item_Ledger_Entry_No_; "Last Item Ledger Entry No.")
                { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                { }
                column(Unit_Cost__ACY_; "Unit Cost (ACY)")
                { }
                column(Variant_Code; "Variant Code")
                { }
                column(Bin_Code; "Bin Code")
                { }
                column(Qty__per_Unit_of_Measure; "Qty. per Unit of Measure")
                { }
                column(Qty__Rounding_Precision; "Qty. Rounding Precision")
                { }
                column(Qty__Rounding_Precision__Base_; "Qty. Rounding Precision (Base)")
                { }
                column(Quantity__Base_; "Quantity (Base)")
                { }
                column(Item_Category_Code; "Item Category Code")
                { }
                column(Purchasing_Code; "Purchasing Code")
                { }
                column(Applies_from_Entry; "Applies-from Entry")
                { }
                column(Applies_to_Value_Entry; "Applies-to Value Entry")
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
    trigger OnInitReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}