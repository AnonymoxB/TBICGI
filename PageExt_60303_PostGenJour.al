pageextension 60303 "Posted General Journal" extends "Posted General Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Functions")
        {
            action("Print Bukti")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Bukti Bank';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rGenJour: Record "Posted Gen. Journal Line";
                begin
                    rGenJour.SetRange("Document No.", Rec."Document No.");
                    rGenJour.SetRange("Document Date", Rec."Document Date");
                    if rGenJour.FindFirst() then begin
                        Report.RunModal(Report::"BuktiBankKeluarMasuk", true, false, rGenJour);
                    end;
                end;
            }
            action("Print Jurnal")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Jurnal';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rGenJour: Record "Posted Gen. Journal Line";
                begin
                    rGenJour.SetRange("Document No.", Rec."Document No.");
                    rGenJour.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    if rGenJour.FindFirst() then begin
                        Report.RunModal(Report::"FormJurnalAcc", true, false, rGenJour);
                    end;
                end;
            }
            action("Print Payment Journal")
            {
                ApplicationArea = all;
                Image = Print;
                Caption = 'Print Payment Journal';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rGenJour: Record "Posted Gen. Journal Line";
                begin
                    rGenJour.SetRange("Document No.", Rec."Document No.");
                    if rGenJour.FindFirst() then begin
                        Report.RunModal(Report::"PostedPaymentJournal", true, false, rGenJour);
                    end;
                end;
            }
        }
    }
}