pageextension 60206 "Posted Invt. Receipt" extends "Posted Invt. Receipt"
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
            action("Print Hasil Produksi")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Hasil Produksi';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rInvtHeader: Record "Invt. Receipt Header";
                begin
                    rInvtHeader.SetRange("No.", Rec."No.");
                    if rInvtHeader.FindFirst() then begin
                        Report.RunModal(Report::"HasilProduksi", true, false, rInvtHeader);
                    end;
                end;
            }


        }
    }
}