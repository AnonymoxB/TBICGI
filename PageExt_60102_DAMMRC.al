pageextension 60102 "DAM Maint. Req. Card" extends "DAM Maint. Req. Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("DAMMRShowDocuments")
        {
            action("Print Request")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Request';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rMaintRequest: Record "DAM Maintenance Request";
                begin
                    rMaintRequest.SetRange("No.", Rec."No.");
                    if rMaintRequest.FindFirst() then begin
                        Report.RunModal(Report::"Request", true, false, rMaintRequest);
                    end;
                end;
            }
        }
    }
}