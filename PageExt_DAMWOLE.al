pageextension 60104 "DAM Work Order Ledger Entries" extends "DAM Work Order Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("ShowDocument")
        {
            action("Print Laporan")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Laporan';
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                var
                    rWorkLedg: Record "DAM Work Order Ledger Entry";
                begin
                    if rWorkLedg.FindFirst() then begin
                        Report.RunModal(Report::"LaporanRealisasiMaintenance", true, false, rWorkLedg);
                    end;
                end;
            }
        }
    }
}