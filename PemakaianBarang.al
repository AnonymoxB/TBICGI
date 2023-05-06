report 60406 PemakaianBarang
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Pemakaian Barang';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/PemakaianBarang.rdl';

    dataset
    {
        dataitem("Invt. Document Header"; "Invt. Document Header")
        {
            column(No_; "No.") { }
            column(Posting_Description; "Posting Description") { }
            column(Location_Code; "Location Code") { }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group") { }
            column(Posting_Date; "Posting Date") { }
            column(Document_Date; "Document Date") { }
            column(External_Document_No_; "External Document No.") { }
            column(Salesperson_Purchaser_Code; "Salesperson/Purchaser Code") { }
            column(Correction; Correction) { }
            column(Status; Status) { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Invt. Document Line"; "Invt. Document Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(Document_Type; "Document Type") { }
                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Unit_Amount; "Unit Amount") { }
                column(Amount; Amount) { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                column(Applies_to_Entry; "Applies-to Entry") { }
                column(Line_No_; "Line No.") { }
                column(Item_Category_Code; "Item Category Code") { }
                column(Purchasing_Code; "Purchasing Code") { }
                column(Inventory_Posting_Group; "Inventory Posting Group") { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
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