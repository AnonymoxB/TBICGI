report 60510 LaporanPembelianDetail
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Laporan Pembelian Detail';
    ApplicationArea = All;
    DefaultLayout = RDLC;

    RDLCLayout = './Rdlc/LaporanPembelianDetail.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(Document_Type; "Document Type")
            { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            { }
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.")
            { }
            column(Pay_to_Name; "Pay-to Name")
            { }
            column(Pay_to_Contact; "Pay-to Contact")
            { }
            column(Pay_to_Address; "Pay-to Address")
            { }
            column(Pay_to_City; "Pay-to City")
            { }
            column(Order_Date; "Order Date")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            { }
            column(Vendor_Shipment_No_; "Vendor Shipment No.")
            { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            { }
            column(Buy_from_Address; "Buy-from Address")
            { }
            column(Buy_from_Contact; "Buy-from Contact")
            { }
            column(Buy_from_Contact_No_; "Buy-from Contact No.")
            { }
            column(Payment_Discount__; "Payment Discount %")
            { }
            column(Payment_Terms_Code; "Payment Terms Code")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Status; Status)
            { }
            column(Jml; TotalHarga)
            { }
            column(Ship_to_Name; "Ship-to Name")
            { }
            column(Ship_to_Address; "Ship-to Address")
            { }
            column(Ship_to_Contact; "Ship-to Contact")
            { }
            column(CompanyPic; CompanyInfo.Picture)
            { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Buy-from Vendor No." = field("Buy-from Vendor No.");

                column(Type; Type)
                { }
                column(No_; "No.")
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
                column(Currency_Code; "Currency Code")
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

                trigger OnAfterGetRecord()
                begin
                    TotalHarga := Quantity * "Unit Price (LCY)";
                end;
            }
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnInitReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        TotalHarga: Decimal;
}