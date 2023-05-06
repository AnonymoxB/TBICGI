pageextension 60504 "Posted Return Shipment" extends "Posted Return Shipment"
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
            action("Print Return Shipment")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Return Shipment';
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                var
                    rReturnHeader: Record "Return Shipment Header";
                begin
                    rReturnHeader.SetRange("No.", Rec."No.");
                    if rReturnHeader.FindFirst() then begin
                        Report.RunModal(Report::"PostedPurchaseReturnShipment", true, false, rReturnHeader);
                    end;
                end;
            }
        }
    }
}