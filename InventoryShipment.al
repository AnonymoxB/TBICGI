report 60207 InventoryShipment
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Inventory Shipment';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/InventoryShipment.rdl';

    dataset
    {
        dataitem("Invt. Document Header"; "Invt. Document Header")
        {
            column(No_; "No.")
            { }
            column(Posting_Description; "Posting Description")
            { }
            column(Document_Type; "Document Type")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Location_Code; "Location Code")
            { }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
            { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            { }
            column(External_Document_No_; "External Document No.")
            { }
            column(Salesperson_Purchaser_Code; "Salesperson/Purchaser Code")
            { }
            column(Correction; Correction)
            { }
            column(Status; Status)
            { }
            column(No__Series; "No. Series")
            { }
            column(Posting_No__Series; "Posting No. Series")
            { }
            column(Dimension_Set_ID; "Dimension Set ID")
            { }
            column(CompanyPic; CompanyInfo.Picture)
            { }
            dataitem("Invt. Document Line"; "Invt. Document Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(Document_No_; "Document No.")
                { }
                column(Line_No_; "Line No.")
                { }
                column(Item_No_; "Item No.")
                { }
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
                column(Unit_Cost; "Unit Cost")
                { }
                column(Unit_Amount; "Unit Amount")
                { }
                column(Amount; Amount)
                { }
                column(Inventory_Posting_Group; "Inventory Posting Group")
                { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                { }
                column(Qty__per_Unit_of_Measure; "Qty. per Unit of Measure")
                { }
                column(Qty__Rounding_Precision; "Qty. Rounding Precision")
                { }
                column(Quantity__Base_; "Quantity (Base)")
                { }
                column(Purchasing_Code; "Purchasing Code")
                { }
            }
        }
    }

    requestpage
    {
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