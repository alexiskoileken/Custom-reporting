table 50104 wood
{
    Caption = 'wood';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "primary key"; Code[20])
        {
            Caption = 'primary key';
        }
        field(2; name; Text[30])
        {
            Caption = 'name';
        }
        field(3; status; Option)
        {
            Caption = 'status';
            OptionMembers = single,married;
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
