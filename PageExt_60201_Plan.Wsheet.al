pageextension 60201 "Planning Worksheet" extends "Planning Worksheet"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Get &Action Messages")
        {
            action("Print SPK")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print SPK';
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                var
                    rPlanWork: Record "Requisition Line";
                begin
                    if rPlanWork.FindFirst() then begin
                        Report.RunModal(Report::"SPK", true, false, rPlanWork);
                    end;
                end;
            }
        }
    }
}