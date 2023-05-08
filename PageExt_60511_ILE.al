pageextension 60511 "Item Ledger Entries" extends "Item Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("F&unctions")
        {
            action("Print Usage Barang")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Usage Barang';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rItemLedg: Record "Item Ledger Entry";
                begin
                    if rItemLedg.FindFirst() then begin
                        Report.RunModal(Report::"LaporanUsageBarang", true, false, rItemLedg);
                    end;
                end;
            }
            action("Print Turnover")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Turnover';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rItemLedg: Record "Item Ledger Entry";
                begin
                    if rItemLedg.FindFirst() then begin
                        Report.RunModal(Report::"LaporanTurnover", true, false, rItemLedg);
                    end;
                end;
            }
        }
    }
}