pageextension 60105 "Resource Ledger Entries" extends "Resource Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Navigate")
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
                    rResLedg: Record "Res. Ledger Entry";
                begin
                    if rResLedg.FindFirst() then begin
                        Report.RunModal(Report::"RealisasiPengerjaanEnginering", true, false, rResLedg);
                    end;
                end;
            }
        }
    }
}