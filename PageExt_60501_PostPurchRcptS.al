pageextension 60501 "Posted Purchase Receipts" extends "Posted Purchase Receipts"
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
            action("Print Purchase Receipt")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Report Daily Receiving';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rPurchHeader: Record "Purch. Rcpt. Header";
                begin
                    if rPurchHeader.FindFirst() then begin
                        Report.RunModal(Report::"PurchaseReceipt", true, false, rPurchHeader);
                    end;
                end;
            }
        }
    }
}