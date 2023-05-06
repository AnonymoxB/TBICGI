report 60103 WorkOrderPlan
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Work Order Plan';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Rdlc/WorkOrderPlan.rdl';

    dataset
    {
        dataitem("DAM Work Order Header"; "DAM Work Order Header")
        {
            column(Document_Type; "Document Type")
            { }
            column(Asset_No_; "Asset No.")
            { }
            column(Asset_Description; "Asset Description")
            { }
            column(Category_Code; "Category Code")
            { }
            column(Priority_Code; "Priority Code")
            { }
            column(Priority_Description; "Priority Description")
            { }
            column(Next_Planned_Date; "Next Planned Date")
            { }
            column(Last_Done_Date; "Last Done Date")
            { }
            column(No__Series; "No. Series")
            { }
            column(Status; Status)
            { }
            column(Description; Description)
            { }
            column(Plan_No_; "Plan No.")
            { }
            column(Frequency_Line_No_; "Frequency Line No.")
            { }
            column(Actual_Next_Planned_Date; "Actual Next Planned Date")
            { }
            column(Notes; Notes)
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Posting_Option; "Posting Option")
            { }
            column(Usage; Usage)
            { }
            column(Close; Close)
            { }
            column(Location_Code; "Location Code")
            { }
            column(Latest_Finish_Date; "Latest Finish Date")
            { }
            column(Waiting_Reason_Description; "Waiting Reason Description")
            { }
            column(Waiting_Reasons_Exist; "Waiting Reasons Exist")
            { }
            column(Downtime_Entry_No_; "Downtime Entry No.")
            { }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            { }
            column(Before_Work_Checklist_Status; "Before Work Checklist Status")
            { }
            column(During_Work_Checklist_Status; "During Work Checklist Status")
            { }
            column(After_Work_Checklist_Status; "After Work Checklist Status")
            { }
            column(Warranty_No_; "Warranty No.")
            { }
            column(Claim_No_; "Claim No.")
            { }
            column(Instructions; Instructions)
            { }
            column(Created_By; "Created By")
            { }
            column(Created_At; "Created At")
            { }
            column(Created_Manually; "Created Manually")
            { }
            column(Maintenance_Request_No_; "Maintenance Request No.")
            { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            { }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            { }
            column(CompanyPic; CompanyInfo.Picture) { }
            dataitem("DAM Work Order Frequency"; "DAM Work Order Frequency")
            {
                column(Document_No_; "Document No.")
                { }
                column(Line_No_; "Line No.")
                { }
                column(Frequency_Type; "Frequency Type")
                { }
                column(Frequency_No_; "Frequency No.")
                { }
                column(Frequency_Description; "Frequency Description")
                { }
                column(Corrective_Maintenance; "Corrective Maintenance")
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
                column(Next_Planned_Counter_Reading; "Next Planned Counter Reading")
                { }
                column(Work_Order_No_; "Work Order No.")
                { }
            }
            dataitem("DAM Work Order Line"; "DAM Work Order Line")
            {
                column(Type; Type)
                { }
                column(No_; "No.")
                { }
                column(Quantity; Quantity)
                { }
                column(Qty__to_Consume; "Qty. to Consume")
                { }
                column(Qty__Consumed; "Qty. Consumed")
                { }
                column(Expected_Unit_Cost__LCY_; "Expected Unit Cost (LCY)")
                { }
                column(Expected_Line_Cost__LCY_; "Expected Line Cost (LCY)")
                { }
                column(Outstanding_Quantity; "Outstanding Quantity")
                { }
                column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
                { }
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