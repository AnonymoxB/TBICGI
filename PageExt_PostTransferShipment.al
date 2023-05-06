pageextension 60507 "PostedTransferShipment" extends "Posted Transfer Shipment"
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
            action("Print Transfer Shipment")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Transfer Shipment';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rTrfHeader: Record "Transfer Shipment Header";
                begin
                    rTrfHeader.SetRange("No.", Rec."No.");
                    if rTrfHeader.FindFirst() then begin
                        Report.RunModal(Report::"PostedTransferShipment", true, false, rTrfHeader);
                    end;
                end;
            }
            // action("Print SJ Laundry")
            // {
            //     ApplicationArea = all;
            //     Image = Print;
            //     Caption = 'Print SJ Laundry';
            //     Promoted = true;
            //     PromotedCategory = Process;

            //     trigger OnAction()
            //     var
            //         rTrfHeader: Record "Transfer Shipment Header";
            //     begin
            //         rTrfHeader.SetRange("No.", Rec."No.");
            //         if rTrfHeader.FindFirst() then begin
            //             Report.RunModal(Report::"SuratJalanLaundry", true, false, rTrfHeader);
            //         end;
            //     end;
            // }
        }
    }
}