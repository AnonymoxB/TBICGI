pageextension 60205 "Posted Invt. Shipment" extends "Posted Invt. Shipment"
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
            action("Print Hasil Consume")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Hasil Consume';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rInvtHeader: Record "Invt. Shipment Header";
                begin
                    rInvtHeader.SetRange("No.", Rec."No.");
                    if rInvtHeader.FindFirst() then begin
                        Report.RunModal(Report::"HasilConsume", true, false, rInvtHeader);
                    end;
                end;
            }
        }
    }
}