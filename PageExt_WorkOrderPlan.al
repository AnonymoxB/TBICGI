pageextension 60103 "WorkOrderPlan" extends "DAM Work Order Plan"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Action9")
        {
            action("Print Work Order Plan")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Work Order Plan';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rWorkHeader: Record "DAM Work Order Header";
                begin
                    rWorkHeader.SetRange("No.", Rec."No.");
                    if rWorkHeader.FindFirst() then begin
                        Report.RunModal(Report::"WorkOrderPlan", true, false, rWorkHeader);
                    end;
                end;
            }
        }
    }
}