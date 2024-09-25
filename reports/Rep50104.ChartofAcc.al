/// <summary>
/// Report Chart of Acc (ID 50104).
/// </summary>
report 50104 "Chart of Acc"
{
    ApplicationArea = All;
    Caption = 'Chart of Acc';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/Chart of ACC.rdl';
    dataset
    {
        dataitem(GLAccount; "G/L Account")
        {
            RequestFilterFields = "No.", "Account Type";
            RequestFilterHeading = 'Option';
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(IncomeBalance; "Income/Balance")
            {
            }
            column(DebitCredit; "Debit/Credit")
            {
            }
            column(NetChange; "Net Change")
            {
            }
            column(CompLogo; CompInfo.Picture)
            {
            }
            column(CompName; CompInfo.Name)
            {
            }
            column(ReportHeading; ReportHeading)
            {
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
        ReportHeading: label 'Trial Balance';
        CompInfo: Record "Company Information";
}
