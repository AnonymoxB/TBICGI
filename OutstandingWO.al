report 60106 OutstandingWO
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Outstanding WO';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/OutstandingWO.rdl';

    dataset
    {
        dataitem("DAM Work Order Header"; "DAM Work Order Header")
        {
            column(Document_Type; "Document Type") { }
            column(No_; "No.") { }
            column(Asset_No_; "Asset No.") { }
            column(Asset_Description; "Asset Description") { }
            column(Category_Code; "Category Code") { }
            column(Priority_Code; "Priority Code") { }
            column(Priority_Description; "Priority Description") { }
            column(Next_Planned_Date; "Next Planned Date") { }
            column(Last_Done_Date; "Last Done Date") { }
            column(Description; Description) { }
            column(No__Series; "No. Series") { }
            column(Status; Status) { }
            column(Plan_No_; "Plan No.") { }
            column(Instructions; Instructions) { }
            column(CompanyPic; CompanyPic.Picture) { }
        }
    }

    requestpage
    {
        SaveValues = true;
    }
    trigger OnInitReport();
    begin
        CompanyPic.get();
        CompanyPic.CalcFields(Picture);
    end;

    var
        CompanyPic: Record "Company Information";
}