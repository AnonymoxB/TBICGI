pageextension 60207 "Posted Invt. Shipments" extends "Posted Invt. Shipments"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document Date")
        {
            field(_UserID; _UserID.SystemCreatedBy)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Created By';
            }
        }
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

    trigger OnAfterGetRecord()
    begin
        _UserID.Get();
        _UserID.CalcFields(SystemCreatedBy);
    end;

    var
        _UserID: Record User;

}