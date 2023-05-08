pageextension 60202 "Invt. Shipment" extends "Invt. Shipment"
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
            action("Print Order Consume")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Order Consume';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rInvtHeader: Record "Invt. Document Header";
                begin
                    rInvtHeader.SetRange("No.", Rec."No.");
                    if rInvtHeader.FindFirst() then begin
                        Report.RunModal(Report::"OrderConsume", true, false, rInvtHeader);
                    end;
                end;
            }
            action("Print Item Usage")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Item Usage';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rInvtHeader: Record "Invt. Document Header";
                begin
                    rInvtHeader.SetRange("No.", Rec."No.");
                    if rInvtHeader.FindFirst() then begin
                        Report.RunModal(Report::"PemakaianBarang", true, false, rInvtHeader);
                    end;
                end;
            }
            action("Print Inventory Shipment")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Inventory Shipment';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rInvtHeader: Record "Invt. Document Header";
                begin
                    rInvtHeader.SetRange("No.", Rec."No.");
                    if rInvtHeader.FindFirst() then begin
                        Report.RunModal(Report::"InventoryShipment", true, false, rInvtHeader);
                    end;
                end;
            }
        }
    }
}