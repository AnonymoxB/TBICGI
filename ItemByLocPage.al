page 60413 ItemByLocationPage
{
    Caption = 'Item By Location Page';
    UsageCategory = Lists;
    ApplicationArea = All;
    PageType = List;
    SourceTable = ILETemp;
    SourceTableView = sorting("Item No.") order(ascending);
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Location Code"; Rec."Location Code") { ApplicationArea = All; }
                field("Remaining Quantity"; Rec."Remaining Quantity") { ApplicationArea = All; }
                field("Unit Of Measure Code"; Rec."Unit Of Measure Code") { ApplicationArea = All; }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)") { ApplicationArea = All; }
            }
        }
    }
    trigger OnOpenPage()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        _LineNo: Integer;
    begin
        _LineNo := 0;

        ItemLedgerEntry.SetCurrentKey("Item No.", "Location Code");
        if ItemLedgerEntry.FindSet() then
            repeat
                Rec.SetFilter("Item No.", ItemLedgerEntry."Item No.");
                Rec.SetFilter("Location Code", ItemLedgerEntry."Location Code");
                if not Rec.FindSet() then begin
                    _LineNo += 1;
                    Rec.Init();
                    Rec."Entry No." := _LineNo;
                    Rec."Item No." := ItemLedgerEntry."Item No.";
                    Rec.Description := ItemLedgerEntry.Description;
                    Rec."Location Code" := ItemLedgerEntry."Location Code";
                    Rec."Unit Of Measure Code" := ItemLedgerEntry."Unit of Measure Code";
                    Rec.Insert()
                end else begin
                    ItemLedgerEntry.CalcFields("Cost Amount (Actual)");
                    Rec."Cost Amount (Actual)" += ItemLedgerEntry."Cost Amount (Actual)";
                    Rec."Remaining Quantity" += ItemLedgerEntry."Remaining Quantity";
                    Rec.Modify();
                end;
            until ItemLedgerEntry.Next() = 0;
        Rec.Reset();
        Rec.SetFilter("Remaining Quantity", '<> 0');
    end;

    var
        myInt: Integer;
        LocationX: Text;
}