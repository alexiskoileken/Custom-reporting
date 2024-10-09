/// <summary>
/// Table Customer Overview (ID 50102).
/// </summary>
table 50102 "Customer Overview"
{
    Caption = 'Customer Overview';
    DataClassification = CustomerContent;

    fields
    {
        field(1; EntryNo; Integer)
        {
            Caption = 'EntryNo';
            DataClassification = CustomerContent;
        }
        field(2; CustomerNo; Code[20])
        {
            Caption = 'CustomerNo';
            DataClassification = CustomerContent;
        }
        field(3; CustomerName; Text[100])
        {
            Caption = 'CustomerName';
            DataClassification = CustomerContent;
        }
        field(4; SourceCode; Code[20])
        {
            Caption = 'SourceCode';
            DataClassification = CustomerContent;
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(6; LastRunDate; DateTime)
        {
            Caption = 'LastRunDate';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }
}
