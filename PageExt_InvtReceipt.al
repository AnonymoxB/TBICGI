pageextension 60203 "Invt. Receipt" extends "Invt. Receipt"
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
            action("Print Order Output")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Order Output';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rInvtHeader: Record "Invt. Document Header";
                begin
                    rInvtHeader.SetRange("No.", Rec."No.");
                    if rInvtHeader.FindFirst() then begin
                        Report.RunModal(Report::"OrderOutput", true, false, rInvtHeader);
                    end;
                end;
            }
        }
    }
}