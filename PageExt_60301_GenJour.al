pageextension 60301 "General Journal" extends "General Journal"
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
            action("Print Permintaan Pembayaran")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Permintaan Pembayaran';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rJourHeader: Record "Gen. Journal Line";
                begin
                    rJourHeader.SetRange("Document No.", Rec."Document No.");
                    if rJourHeader.FindFirst() then begin
                        Report.RunModal(Report::"PermintaanPembayaran", true, false, rJourHeader);
                    end;
                end;
            }
        }
    }
}