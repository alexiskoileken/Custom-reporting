/// <summary>
/// TableExtension Customer ext (ID 50101) extends Record Customer.
/// </summary>
tableextension 50101 "Customer ext" extends Customer
{
    fields
    {

    }
    /// <summary>
    /// UpdateCreditLimit.
    /// </summary>
    /// <param name="NewCreditLimit">VAR Decimal.</param>
    procedure UpdateCreditLimit(var NewCreditLimit: Decimal)
    var
        myInt: Integer;
    begin
        NewCreditLimit := Round(NewCreditLimit, 10000);
        rec.Validate("Credit Limit (LCY)", NewCreditLimit);
        rec.Modify()
    end;

    /// <summary>
    /// CalculateCreditLimit.
    /// </summary>
    /// <returns>Return value of type Decimal.</returns>
    procedure CalculateCreditLimit(): Decimal
    var
        Cust: Record Customer;
    begin
        cust.Reset();
        cust.SetRange("Date Filter", CalcDate('<-12M>', WorkDate()), WorkDate());
        Cust.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(Round(cust."Sales (LCY)" * 0.5))

    end;
}
