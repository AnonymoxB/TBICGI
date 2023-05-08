report 60516 TransferOrderForm
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Transfer Order Form';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_605016_FormTO.rdl';
    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            column(No_; "No.") { }
            column(Transfer_from_Code; "Transfer-from Code") { }
            column(Transfer_from_Name; "Transfer-from Name") { }
            column(Transfer_to_Code; "Transfer-to Code") { }
            column(Transfer_to_Name; "Transfer-to Name") { }
            column(Posting_Date; "Posting Date") { }
            column(Shipment_Date; "Shipment Date") { }
            column(Receipt_Date; "Receipt Date") { }
            column(Status; Status) { }
            column(Comment; Comment) { }
            column(In_Transit_Code; "In-Transit Code") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Transfer Line"; "Transfer Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Line_No_; "Line No.") { }
                column(Item_No_; "Item No.") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Description; Description) { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
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
        myInt: Integer;
}