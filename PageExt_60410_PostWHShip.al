pageextension 60410 "PostedWarehouseShipment" extends "Posted Whse. Shipment"
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
            action("Print Whse. Shipment")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Whse. Shipment';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rWhseHeader: Record "Posted Whse. Shipment Header";
                begin
                    rWhseHeader.SetRange("No.", Rec."No.");
                    if rWhseHeader.FindFirst() then begin
                        Report.RunModal(Report::"PostedWarehouseShipment", true, false, rWhseHeader);
                    end;
                end;
            }
        }
    }
}