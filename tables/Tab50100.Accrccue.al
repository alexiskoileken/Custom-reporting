/// <summary>
/// Table Acc rc cue (ID 50100).
/// </summary>
table 50100 "Acc rc cue"
{
    Caption = 'Acc rc cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "primary key"; Code[20])
        {
            Caption = 'primary key';
        }
        field(2; "No of logged users"; Integer)
        {
            fieldclass = FlowField;
            CalcFormula = count("Active Session" where("Client Type" = const("Web Client")));
        }
        field(3; "biggest Sales"; Decimal)
        {
            Caption = 'biggest sales';
            Editable = false;
        }
    }


    keys
    {
        key(PK; "primary key")
        {
            Clustered = true;
        }
    }
    /// <summary>
    /// GetBiggestSales.
    /// </summary>
    /// <returns>Return variable BiggestSale of type Decimal.</returns>
    procedure GetBiggestSales() BiggestSale: Decimal
    var
        Salesline: Record "Sales Line";
        SalesValue: Decimal;
    begin
        SalesValue := 0;
        salesline.reset();
        Salesline.SetRange("Document Type", Salesline."Document Type"::Order);
        Salesline.SetFilter(Amount, '>=%1', SalesValue);
        Salesline.Ascending(false);
        if Salesline.FindFirst() then begin
            BiggestSale := Salesline.Amount;
        end;
    end;
}
