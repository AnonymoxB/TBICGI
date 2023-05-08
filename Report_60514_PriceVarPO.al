report 60514 PriceVariantPO
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Price Variant PO Report';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_60514_PriceVarPO.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.";
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Order_Date; "Order Date") { }
            column(Posting_Date; "Posting Date") { }
            column(StdTot; StdTot) { }
            column(MktTot; MktTot) { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                RequestFilterFields = "Transaction Type", "Gen. Bus. Posting Group";
                column(Document_Type; "Document Type") { }
                column(Document_No_; "Document No.") { }
                column(Line_No_; "Line No.") { }
                column(Type; Type) { }
                column(No_; "No.") { }
                column(Description; Description) { }
                column(Location_Code; "Location Code") { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Job_Unit_Price; "Job Unit Price") { }
                column(Unit_Price_Temp; "Unit Price Temp") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group") { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
                column(Transaction_Type; "Transaction Type") { }
                column(Selisih; Selisih) { }
                trigger OnAfterGetRecord()
                var
                    Searchstr: Integer;
                begin
                    StdTot := Quantity * "Unit Price Temp"; // Direct Unit Cost Dari Purchase Price
                    MktTot := Quantity * "Direct Unit Cost"; // Direct Unit Cost Dari Purchase Order
                    Selisih := StdTot - MktTot;
                end;
            }
            trigger OnAfterGetRecord()
            begin

            end;
        }
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        StdTot: Decimal;
        MktTot: Decimal;
        Selisih: Decimal;
}