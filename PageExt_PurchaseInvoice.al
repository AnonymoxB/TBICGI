pageextension 60502 "PurchaseInvoice" extends "Purchase Invoice"
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
            action("Print Purchase Invoice")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Purchase Invoice';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rPurchHeader: Record "Purchase Header";
                begin
                    rPurchHeader.SetRange("No.", Rec."No.");
                    if rPurchHeader.FindFirst() then begin
                        Report.RunModal(Report::"PurchaseInvoice", true, false, rPurchHeader);
                    end;
                end;
            }
        }
    }
}