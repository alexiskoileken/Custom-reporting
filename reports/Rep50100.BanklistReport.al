/// <summary>
/// Report Bank list Report (ID 50100).
/// </summary>
report 50100 "Bank list Report"
{
    ApplicationArea = All;
    Caption = 'Bank list Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/BankReportList.rdl';
    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.", Name;
            RequestFilterHeading = 'Option';
            column(CompanyPicture; CompInfo.Picture) { }
            column(CompanyName; CompInfo.Name) { }
            column(ReportHeading; ReportHeading) { }
            column(No_; "No.") { }
            column(Name; Name) { }
            column(Balance__LCY_; "Balance (LCY)") { }


        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture);

    end;

    var
        CompInfo: Record "Company Information";
        ReportHeading: Label 'Bank Report List';
}
