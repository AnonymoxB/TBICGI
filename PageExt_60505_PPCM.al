pageextension 60505 "Posted Purchase Credit Memo" extends "Posted Purchase Credit Memo"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Print")
        {
            action("Print PCM")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print PCM';
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                var
                    rPurchHeader: Record "Purch. Cr. Memo Hdr.";
                begin
                    rPurchHeader.SetRange("No.", Rec."No.");
                    if rPurchHeader.FindFirst() then begin
                        Report.RunModal(Report::"PCMSesuaiBisnisUnit", true, false, rPurchHeader);
                    end;
                end;
            }
        }
    }
}