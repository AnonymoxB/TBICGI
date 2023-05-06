report 60411 PurchaseOrderForm
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Purchase Order Form';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/PurchaseOrderForm.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.";
            column(Document_Type; "Document Type") { }
            column(No_; "No.") { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.") { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_Name_2; "Pay-to Name 2") { }
            column(Pay_to_Contact; "Pay-to Contact") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_Post_Code; "Pay-to Post Code") { }
            column(Pay_to_City; "Pay-to City") { }
            column(Order_Date; "Order Date") { }
            column(Posting_Date; "Posting Date") { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.") { }
            column(Vendor_Shipment_No_; "Vendor Shipment No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Buy_from_Address; "Buy-from Address") { }
            column(Buy_from_Contact; "Buy-from Contact") { }
            column(Buy_from_Contact_No_; "Buy-from Contact No.") { }
            column(Payment_Discount__; "Payment Discount %") { }
            column(Payment_Terms_Code; "Payment Terms Code") { }
            column(Document_Date; "Document Date") { }
            column(Status; Status) { }
            column(Jml; TotalHarga) { }
            column(HeaderCaption; HeaderCaption) { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Contact; "Ship-to Contact") { }
            column(Transaction_Type; "Transaction Type") { }
            column(Currency_Code; "Currency Code") { }
            column(Purchaser_Code; "Purchaser Code") { }
            column(Prepayment__; "Prepayment %") { }
            column(Approv1; Approv1) { }
            column(Approv2; Approv2) { }
            column(Approv3; Approv3) { }
            column(Approv4; Approv4) { }
            column(Approv5; Approv5) { }
            column(xApprov1; xApprov1) { }
            column(xApprov2; xApprov2) { }
            column(xApprov3; xApprov3) { }
            column(xApprov4; xApprov4) { }
            column(xApprov5; xApprov5) { }
            column(QrCode; QrCode) { }
            column(PayTermsDesc; PayTermsDesc) { }
            column(CommentHead; CommentHead) { }
            column(Purcname; Purcname) { }
            column(AmountHead; Amount) { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");

                column(Type; Type)
                { }
                column(No_Item; "No.")
                { }
                column(Document_No_; "Document No.")
                { }
                column(Description; Description)
                { }
                column(Location_Code; "Location Code")
                { }
                column(Bin_Code; "Bin Code")
                { }
                column(Quantity; Quantity)
                { }
                column(Outstanding_Quantity; "Outstanding Quantity")
                { }
                column(Quantity_Received; "Quantity Received")
                { }
                column(Quantity_Invoiced; "Quantity Invoiced")
                { }
                column(Qty__to_Invoice; "Qty. to Invoice")
                { }
                column(Qty__to_Receive; "Qty. to Receive")
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
                column(Unit_Price__LCY_; "Unit Price (LCY)")
                { }
                column(Direct_Unit_Cost; "Direct Unit Cost")
                { }
                column(Amount; Amount)
                { }
                column(VAT__; "VAT %")
                { }
                column(Line_Discount__; "Line Discount %")
                { }
                column(Line_Discount_Amount; "Line Discount Amount")
                { }
                column(Inv__Disc__Amount_to_Invoice; "Inv. Disc. Amount to Invoice")
                { }
                column(Inv__Discount_Amount; "Inv. Discount Amount")
                { }
                column(Expected_Receipt_Date; "Expected Receipt Date")
                { }
                column(Planned_Receipt_Date; "Planned Receipt Date")
                { }

                dataitem("Purch. Comment Line"; "Purch. Comment Line")
                {
                    DataItemLink = "Document Type" = field("Document Type"), "NO." = field("Document No."), "Document Line No." = field("Line No.");
                    column(Comment; Comment)
                    { }
                }
                trigger OnAfterGetRecord()
                begin
                    TotalHarga := (Quantity * "Direct Unit Cost") - "Line Discount Amount";
                end;

            }
            trigger OnAfterGetRecord()
            var
                xPurchHead: Record "Purchase Header";
                xPayTerms: Record "Payment Terms";
                xPuchComLine: Record "Purch. Comment Line";
                xSalesPerson: Record "Salesperson/Purchaser";
                xPurItemLine: Record "Purchase Line";
                QrCodeSym: Enum "Barcode Symbology 2D";
                QrCodePro: Interface "Barcode Font Provider 2D";

            begin
                QrCode := "Purchase Header"."No.";
                QrCodePro := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                QrCodeSym := Enum::"Barcode Symbology 2D"::"QR-Code";
                QrCode := QrCodePro.EncodeFont(QrCode, QrCodeSym);

                xPayTerms.SetRange(Code, "Purchase Header"."Payment Terms Code");
                if xPayTerms.FindFirst() then
                    PayTermsDesc := xPayTerms.Description;

                xPuchComLine.SetRange("No.", "Purchase Header"."No.");
                if xPuchComLine.FindFirst() then
                    CommentHead := xPuchComLine.Comment;

                xSalesPerson.SetRange(Code, "Purchase Header"."Purchaser Code");
                if xSalesPerson.FindFirst() then
                    Purcname := xSalesPerson.Name;

                xPurItemLine.SetRange("Document No.", "Purchase Header"."No.");
                if xPurItemLine.FindFirst() then
                    Locationx := xPurItemLine."Location Code";

                if "Purchase Header"."Transaction Type" = 'FOD' then begin
                    HeaderCaption := 'Market List Order';
                    Approv1 := '(Purchasing SPV)'; //Pak Pebri
                    xApprov1 := 'PurSPVPebri2';
                    Approv2 := '(Director Of Finance)'; //Pak Otong
                    xApprov2 := 'DOFOtong';
                end else
                    if "Purchase Header"."Transaction Type" = 'BVG' then begin
                        HeaderCaption := 'Market List Order';
                        Approv1 := '(Purchasing SPV)'; //Pak Pebri
                        xApprov1 := 'PurSPVPebri2';
                        Approv2 := '(Director Of Finance)'; //Pak Otong
                        xApprov2 := 'DOFOtong';
                        Approv3 := '(General Manager)'; // Carol
                        xApprov3 := 'GMCarolWaller';
                        Approv4 := '(TBI Management 1)'; //Pak Michael
                        xApprov4 := 'TtdPakMic'
                    end else
                        if "Purchase Header"."Transaction Type" = 'HOS' then begin
                            HeaderCaption := 'Purchase Order';
                            Approv1 := '(Purchasing)'; // Eva
                            xApprov1 := 'PurcEva';
                            Approv2 := '(Director Of Finance)'; //Pak Otong
                            xApprov2 := 'DOFOtong';
                            Approv3 := '(General Manager)'; // Carol
                            xApprov3 := 'GMCarolWaller';
                            Approv4 := '(TBI Management 1)'; //Pak Michael
                            xApprov4 := 'TtdPakMic'
                        end else
                            if "Purchase Header"."Transaction Type" = 'MTN' then begin
                                HeaderCaption := 'Maintenance Order';
                                Approv1 := '(Purchasing)'; //Riski
                                xApprov1 := 'PurcRisk';
                                Approv2 := '(Director Enginering)'; //Pak Enver
                                xApprov2 := 'DirEngineeringEnver';
                                Approv3 := '(Director Of Finance)'; //Pak Otong
                                xApprov3 := 'DOFOtong';
                                Approv4 := '(TBI Management 2)'; //Pak Teguh
                                xApprov4 := 'TtdPakTeguh';
                                Approv5 := '(Director Of TBI)'; //Pak Sur
                                xApprov5 := 'TtdOwn'
                            end else
                                if "Purchase Header"."Transaction Type" = 'SVC' then begin
                                    HeaderCaption := 'Service Order';
                                    Approv1 := '(Purchasing)'; //Eva Riski
                                    if "Purchase Header"."Purchaser Code" = 'EV01' then begin
                                        xApprov1 := 'PurcEva';
                                    end else
                                        if "Purchase Header"."Purchaser Code" = 'RI01' then begin
                                            xApprov1 := 'PurcRisk';
                                        end;
                                    Approv2 := '(Director Of Finance)'; //Pak Otong
                                    xApprov2 := 'DOFOtong';
                                    Approv3 := '(TBI Management 1)'; //Pak Michael
                                    xApprov3 := 'TtdPakMic'
                                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
    }

    trigger OnInitReport()
    var
        xPurchHead: Record "Purchase Header";
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        TotalHarga: Decimal;
        HeaderCaption, Approv1, Approv2, Approv3, Approv4, Approv5, QrCode, TermsCon, PayTermsDesc,
        CommentHead, Purcname, LocationX, xApprov1, xApprov2, xApprov3, xApprov4, xApprov5 : Text;
}