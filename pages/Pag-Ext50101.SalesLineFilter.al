/// <summary>
/// PageExtension Sales Line Filter (ID 50101) extends Record Sales Lines.
/// </summary>
pageextension 50101 "Sales Line Filter" extends "Sales Lines"
{
    layout { }
    actions
    {
        addfirst(Processing)
        {
            action(filter)
            {
                Caption = 'Order sort';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var

                begin
                    GetSalesOrder();
                end;
            }
        }
    }
    local procedure GetSalesOrder()
    var
        SalesLn: Record "Sales Line";
    begin
        SalesLn.Reset();
        SalesLn.SetRange("Document Type", SalesLn."Document Type"::Order);
        SalesLn.SetCurrentKey("Amount Including VAT");
        SalesLn.Ascending(false);
        if SalesLn.FindSet() then begin
            Page.Run(Page::"Sales Lines", SalesLn);
        end else
            Error('Order Document Type not found');
    end;
}
