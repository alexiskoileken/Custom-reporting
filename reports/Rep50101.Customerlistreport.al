/// <summary>
/// Report Customer list report (ID 50101).
/// </summary>
report 50101 "Customer list report"
{
    ApplicationArea = All;
    Caption = 'Customer list report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Rdlc;
    RDLCLayout = 'Layouts/CustomerListReport.rdl';

    dataset
    {
        dataitem(Customer; customer)
        {
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Options';
            column(No_; "No.") { }
            column(Name; Name) { }
            column(Sales__LCY_; "Sales (LCY)") { }
            column(Payments__LCY_; "Payments (LCY)") { }
            column(CompanyName; CompInfo.Name) { }
            column(CompanyPicture; CompInfo.Picture) { }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                column(Posting_Date; "Posting Date") { }
                column(Document_Type; "Document Type") { }
                column(Description; Description) { }
                column(Amount; Amount) { }

            }
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
        ReportHeading: label 'Customer Ledger Entry list';
}
