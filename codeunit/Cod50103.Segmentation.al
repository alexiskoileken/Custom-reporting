/// <summary>
/// Codeunit Segmentation (ID 50103).
/// </summary>
codeunit 50103 Segmentation
{
    trigger OnRun()
    var
        Customer: Record Customer;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        TotalPurchases: Decimal;
    begin

        if Customer.FindSet() then
            repeat
                TotalPurchases := 0;

                SalesInvoiceHeader.SetRange("Sell-to Customer No.", Customer."No.");
                SalesInvoiceHeader.SetRange("Posting Date", CalcDate('<-12M>', WorkDate()), WorkDate());

                if SalesInvoiceHeader.FindSet() then
                    repeat
                        TotalPurchases += SalesInvoiceHeader.Amount;
                    until SalesInvoiceHeader.Next() = 0;

                if TotalPurchases > 50000 then
                    Customer.Segment := Customer.Segment::High
                else if (TotalPurchases >= 10000) and (TotalPurchases <= 50000) then
                    Customer.Segment := Customer.Segment::Medium
                else
                    Customer.Segment := Customer.Segment::Low;

                Customer.Modify(true);
            until Customer.Next() = 0;
    end;

    /// <summary>
    /// ChangeColor.
    /// </summary>
    /// <param name="wood">Record wood.</param>
    /// <returns>Return value of type text.</returns>
    procedure ChangeColor(wood: Record wood): text
    var
        myInt: Integer;
    begin
        case wood.status of
            wood.status::married:
                exit('Unfavorable');
            wood.status::single:
                exit('Favorable');
        end;
    end;

}

