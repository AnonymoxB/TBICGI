table 60412 ItemByLocTable
{
    fields
    {
        field(1; "Entry No."; Integer) { Caption = 'Entry No.'; }
        field(2; "Item No."; Code[20]) { Caption = 'Item No.'; TableRelation = "Item Ledger Entry"; }
        field(3; Description; Text[100]) { Caption = 'Description'; }
        field(4; "Unit Of Measure Code"; Code[10]) { Caption = 'UoM'; TableRelation = "Unit of Measure"; }
        field(5; "Location Code"; Code[10]) { Caption = 'Location'; TableRelation = Location; }
        field(6; "Remaining Quantity"; Decimal)
        {
            Caption = 'Quantity';
            AutoFormatExpression = "Unit Of Measure Code";
            AutoFormatType = 1;
            Editable = false;
        }
        field(7; "Cost Amount (Actual)"; Decimal) { Caption = 'Amount'; }
    }

    keys
    {
        key(PK; "Item No.")
        { }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}