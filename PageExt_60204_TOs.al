pageextension 60204 "Transfer Orders" extends "Transfer Orders"
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
            action("Print Rekap Hasil Produksi")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Rekap Hasil Produksi';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rTrfHeader: Record "Transfer Header";
                begin
                    if rTrfHeader.FindFirst() then begin
                        Report.RunModal(Report::"RekapPermintaanHasilProduksi", true, false, rTrfHeader);
                    end;
                end;
            }
            action("Print Outs TO")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Outstanding TO';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rTrfHeader: Record "Transfer Header";
                begin
                    if rTrfHeader.FindFirst() then begin
                        Report.RunModal(Report::"LaporanOutstandingTO", true, false, rTrfHeader);
                    end;
                end;
            }
        }
    }
}