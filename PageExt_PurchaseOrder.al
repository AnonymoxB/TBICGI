pageextension 60510 "Purchase Order" extends "Purchase Order"
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
            action("Print PO")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print PO';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rPurchHeader: Record "Purchase Header";
                begin
                    rPurchHeader.SetRange("No.", Rec."No.");
                    if rPurchHeader.FindFirst() then begin
                        Report.RunModal(Report::"PurchaseOrderForm", true, false, rPurchHeader);
                    end;
                end;
            }
        }
    }
}