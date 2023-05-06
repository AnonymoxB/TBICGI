pageextension 60514 "Item By Location Ext" extends "Items by Location Matrix"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Base Unit of Measure"; Rec."Base Unit of Measure")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}