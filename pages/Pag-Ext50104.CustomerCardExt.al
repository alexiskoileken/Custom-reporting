/// <summary>
/// PageExtension Customer List Ext (ID 50102) extends Record Customer List.
/// </summary>
pageextension 50102 "Customer List Ext" extends "Customer List"
{
    layout
    {

    }
    actions
    {
        addbefore(Statement)
        {
            action("Customer List Report")
            {
                Caption = 'Customer List Report';
                image = Report;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    Report.Run(Report::"Customer list report");
                end;
            }
        }
        addbefore(WordTemplate)
        {
            action("Anual processing")
            {
                caption = 'Annual processing';
                Image = Payment;
                Promoted = true;
                PromotedCategory = process;
                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    cust.Reset();
                    Cust.SetRange("No.", Rec."No.");
                    if Cust.FindFirst() then
                        Report.Run(Report::"Process Anual transactions", true, false, Cust);

                end;
            }
        }

    }

}
