pageextension 60513 "Purchase Order List" extends "Purchase Order List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Approved Date")
        {
            field("Vendor Order No."; Rec."Vendor Order No.")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("Print")
        {
            action("Print Outs PO")
            {
                ApplicationArea = all;
                Image = Filed;
                Caption = 'Outstanding PO Report';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rPurchHeader: Record "Purchase Header";
                begin
                    if rPurchHeader.FindFirst() then begin
                        Report.RunModal(Report::"LaporanOutstandingPO", true, false, rPurchHeader);
                    end;
                end;
            }
            action("Print Pembelian Detail")
            {
                ApplicationArea = all;
                Image = Filed;
                Caption = 'Purchase Report';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rPurchHeader: Record "Purchase Header";
                begin
                    if rPurchHeader.FindFirst() then begin
                        Report.RunModal(Report::"LaporanPembelianDetail", true, false, rPurchHeader);
                    end;
                end;
            }
            action("Price Variant")
            {
                ApplicationArea = all;
                Image = Filed;
                Caption = 'Price Variant PO Report';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    rPurchHeader: Record "Purchase Header";
                begin
                    if rPurchHeader.FindFirst() then begin
                        Report.RunModal(Report::"PriceVariantPO", true, false, rPurchHeader);
                    end;
                end;
            }
        }
    }
}