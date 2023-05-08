pageextension 60106 "WorkOrders" extends "DAM Work Orders"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Print")
        {
            action("Print Outst WO")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Outst WO';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rWorkHeader: Record "DAM Work Order Header";
                begin
                    if rWorkHeader.FindFirst() then begin
                        rWorkHeader.SetFilter(Status, 'Open|Released');
                        Report.RunModal(Report::"OutstandingWO", true, false, rWorkHeader);
                    end;
                end;
            }
        }
    }
}