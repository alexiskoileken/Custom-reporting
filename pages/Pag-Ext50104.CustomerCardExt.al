/// <summary>
/// PageExtension Customer List Ext (ID 50102) extends Record Customer List.
/// </summary>
pageextension 50102 "Customer List Ext" extends "Customer List"
{
    layout
    {
        movebefore(Name; "Location Code")
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
        addlast(processing)
        {
            action(learn)
            {
                Caption = 'learn';
                Image = Payment;
                Promoted = true;
                PromotedCategory = process;
                trigger OnAction()
                var
                    customer: Record Customer;
                begin
                    customer.Reset();
                    customer.SetRange("Location Code", 'YELLOW');
                    if customer.FindSet() then
                        repeat
                            Page.Run(Page::"Customer List", customer);
                        until customer.Next() = 0
                end;
            }
        }

    }
    var
        v: Record "Source Code";

}
