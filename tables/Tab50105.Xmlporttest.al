table 50105 "Xml port test"
{
    Caption = 'Xml port test';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; no; Code[20])
        {
            Caption = 'no';
        }
        field(2; Descriptions; Text[50])
        {
            Caption = 'Descriptions';
        }
        field(3; "Exported by"; Text[50])
        {
            Caption = 'Exported by';
        }
        field(4; "Exported at"; Time)
        {
            Caption = 'Exported at';
        }
    }
    keys
    {
        key(PK; no)
        {
            Clustered = true;
        }
    }
}
