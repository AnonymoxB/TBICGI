pageextension 60506 "Posted Purchase Invoice" extends "Posted Purchase Invoice"
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
            action("Print Prepayment Purchase")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print PI / Prepayment';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rPurchHeader: Record "Purch. Inv. Header";
                begin
                    rPurchHeader.SetRange("No.", Rec."No.");
                    if rPurchHeader.FindFirst() then begin
                        codes := CopyStr(rPurchHeader."No.", 1, 3);
                        if codes = 'PIP' then begin
                            Report.RunModal(Report::"PurchaseInvoice", true, false, rPurchHeader);
                        end else begin
                            Report.RunModal(Report::"PrepaymentPurchase", true, false, rPurchHeader);
                        end
                    end;
                end;
            }
            // action("Print Purchase Invoice")
            // {
            //     ApplicationArea = all;
            //     Image = Print;
            //     Caption = 'Print Purchase Invoice';
            //     Promoted = true;
            //     PromotedCategory = Process;

            //     trigger OnAction()
            //     var
            //         rPurchHeader: Record "Purch. Inv. Header";
            //     begin
            //         rPurchHeader.SetRange("No.", Rec."No.");
            //         if rPurchHeader.FindFirst() then begin
            //             Report.RunModal(Report::"PurchaseInvoice", true, false, rPurchHeader);
            //         end;
            //     end;
            // }
        }
    }
    var
        codes: Text;
}