pageextension 60508 "PostedTransferReceipt" extends "Posted Transfer Receipt"
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
            action("Print Transfer Receipt")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Transfer Receipt';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rTrfHeader: Record "Transfer Receipt Header";
                begin
                    rTrfHeader.SetRange("No.", Rec."No.");
                    if rTrfHeader.FindFirst() then begin
                        Report.RunModal(Report::"PostedTransferReceipt", true, false, rTrfHeader);
                    end;
                end;
            }
            action("Print Penerimaan Barang")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Penerimaan Barang';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rTrfHeader: Record "Transfer Receipt Header";
                begin
                    rTrfHeader.SetRange("No.", Rec."No.");
                    if rTrfHeader.FindFirst() then begin
                        Report.RunModal(Report::"PenerimaanBarang", true, false, rTrfHeader);
                    end;
                end;
            }
        }
    }
}