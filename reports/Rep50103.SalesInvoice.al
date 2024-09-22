/// <summary>
/// Report Sales Invoice (ID 50103).
/// </summary>
report 50103 "Sales Invoice"
{
    ApplicationArea = All;
    Caption = 'Sales Invoice';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/SalesInvoice.rdl';
    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            RequestFilterHeading = 'options';
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(No; "No.")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(AmountIncludingVAT; "Amount Including VAT")
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
}
