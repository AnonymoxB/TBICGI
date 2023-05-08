pageextension 60503 "Purchase Return Order" extends "Purchase Return Order"
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
            action("Print Return Order")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Return Order';
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                var
                    rPurchHeader: Record "Purchase Header";
                begin
                    rPurchHeader.SetRange("No.", Rec."No.");
                    if rPurchHeader.FindFirst() then begin
                        Report.RunModal(Report::"PurchaseReturnOrder", true, false, rPurchHeader);
                    end;
                end;
            }
        }
    }
}