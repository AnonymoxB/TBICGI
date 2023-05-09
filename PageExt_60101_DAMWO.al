pageextension 60101 "WorkOrder" extends "DAM Work Order"
{
    layout
    {
        // Add changes to page layout here 12345612345
    }

    actions
    {
        // Add changes to page actions here
        addafter("Print")
        {
            action("Print Work Order")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Work Order';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rWorkHeader: Record "DAM Work Order Header";
                begin
                    rWorkHeader.SetRange("No.", Rec."No.");
                    if rWorkHeader.FindFirst() then begin
                        Report.RunModal(Report::"WorkOrder", true, false, rWorkHeader);
                    end;
                end;
            }
        }
    }
}