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
    }
    keys
    {
        key(PK; "primary key")
        {
            Clustered = true;
        }
    }
}
