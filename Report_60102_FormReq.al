report 60102 Request
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Request';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/Rdlc_60102_FormReq.rdl';

    dataset
    {
        dataitem("DAM Maintenance Request"; "DAM Maintenance Request")
        {
            column(No_; "No.") { }
            column(Description; Description) { }
            column(Request_Type; "Request Type") { }
            column(Priority_Code; "Priority Code") { }
            column(Request_Date; "Request Date") { }
            column(Remarks; Remarks) { }
            column(Status; Status) { }
            column(Asset_No_; "Asset No.") { }
            column(Maint__Req__Group_Code; "Maint. Req. Group Code") { }
            column(Asset_Description; "Asset Description") { }
            column(No__Series; "No. Series") { }
            column(Create_By; "Create By") { }
            column(Closed; Closed) { }
            column(Assigned_To; "Assigned To") { }
            column(Last_Modified_DateTime; "Last Modified DateTime") { }
            column(Status_Description; "Status Description") { }
            column(Closed_Date_Time; "Closed Date-Time") { }
            column(Closed_By; "Closed By") { }
            column(Request_Duration; "Request Duration") { }
            column(Closed_Date; "Closed Date") { }
            column(Related_To_Type; "Related To Type") { }
            column(Related_To_No_; "Related To No.") { }
            column(Group_Description; "Group Description") { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("DAM Maint. Req. Comment"; "DAM Maint. Req. Comment")
            {
                DataItemLink = "Request No." = field("No.");
                column(Request_No_; "Request No.") { }
                column(Line_No_; "Line No.") { }
                column(Comment; Comment) { }
                column(Commented_By; "Commented By") { }
            }
            dataitem("DAM Maint. Req. Related Work"; "DAM Maint. Req. Related Work")
            {
                column(Entry_No_; "Entry No.") { }
                column(Plan_No_; "Plan No.") { }
                column(Frequency_Type; "Frequency Type") { }
                column(Plan_Date; "Plan Date") { }
                column(Order_Date; "Order Date") { }
                column(Work_Order_No_; "Work Order No.") { }
                column(Work_Order_Downtime_Entry_No_; "Work Order Downtime Entry No.") { }
                column(Plan_Downtime_Entry_No_; "Plan Downtime Entry No.") { }
                column(Plan_Maint__Req__No_; "Plan Maint. Req. No.") { }
                column(Work_Order_Maint__Req__No_; "Work Order Maint. Req. No.") { }
            }
        }
    }

    requestpage
    {
        SaveValues = true;
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}