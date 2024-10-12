/// <summary>
/// Codeunit Mini Customer  (ID 50102).
/// </summary>
codeunit 50102 "Mini Customer "
{


    trigger OnRun()
    begin
        Cust.Reset();

        if Cust.FindSet() then begin
            repeat

                MiniCust."Customer No" := cust."No.";
                MiniCust."Customer Name" := cust.Name;
                MiniCust.phoneNumber := Cust."Phone No.";
                MiniCust.city := Cust.city;
                Cust.CalcFields(balance);
                MiniCust.balance := Cust.Balance;
                MiniCust.insert
            until cust.Next() = 0;
        end

    end;

    var
        Cust: Record customer;
        CountryRegion: Record "Country/Region";
        MiniCust: Record "Mini Customer";
}
