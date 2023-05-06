pageextension 60111 "DGS Payment Journal" extends "DGS Payment Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Post and &Print")
        {
            action("Request Payment")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Req. Payment';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rGenJouLine: Record "Gen. Journal Line";
                begin
                    rGenJouLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    if rGenJouLine.FindFirst() then begin
                        Report.RunModal(Report::"PermintaanPembayaran", true, false, rGenJouLine);
                    end;
                end;
            }
        }
    }
}