pageextension 60403 "WarehouseReceipt" extends "Warehouse Receipt"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("F&unctions")
        {
            action("Print Warehouse Receipt")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Warehouse Receipt';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rWarHeader: Record "Warehouse Receipt Header";
                begin
                    rWarHeader.SetRange("No.", Rec."No.");
                    if rWarHeader.FindFirst() then begin
                        Report.RunModal(Report::"WarehouseReceipt", true, false, rWarHeader);
                    end;
                end;
            }
        }
    }
}