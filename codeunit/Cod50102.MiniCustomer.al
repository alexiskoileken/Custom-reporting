/// <summary>
/// Codeunit Mini Customer  (ID 50102).
/// </summary>
codeunit 50102 "Mini Customer "
{
    var
        Cust: Record customer;
        CountryRegion: Record "Country/Region";
        MiniCust: Record "Mini Customer";

    trigger OnRun()
    begin
        Cust.FindSet();
        if Cust.Count() > 0 then begin
            repeat
                MiniCust."Customer No" := cust."No.";
                MiniCust."Customer Name" := cust.Name;
                MiniCust.phoneNumber := Cust."Phone No.";
                MiniCust.city := Cust.city;
                Cust.Validate(balance, MiniCust.balance);
                MiniCust.CalcSums(balance);
                MiniCust.balance := Cust.Balance;
                MiniCust.insert;
            until cust.Next() = 0;
        end

    end;
}
