pageextension 60500 "Posted Purchase Receipt" extends "Posted Purchase Receipt"
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
            action("Print GoodReceive")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Detail Good Receive';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rPurchHeader: Record "Purch. Rcpt. Header";
                    rPurchLine: Record "Purch. Rcpt. Line";
                begin
                    rPurchHeader.SetRange("No.", Rec."No.");
                    rPurchLine.SetFilter(Quantity, '<> 0');
                    if rPurchHeader.FindFirst() then begin
                        Report.RunModal(Report::"GoodReceiveDetail", true, false, rPurchHeader);
                    end;
                end;
            }
        }
    }
}