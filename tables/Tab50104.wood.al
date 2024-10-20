table 50104 wood
{
    Caption = 'wood';
    DataClassification = OrganizationIdentifiableInformation;

    fields
    {
        field(1; "primary key"; Code[20])
        {
            Caption = 'primary key';
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(2; name; Text[30])
        {
            Caption = 'name';
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(3; status; Option)
        {
            Caption = 'status';
            OptionMembers = single,married;
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(4; picture; MediaSet)
        {
            Caption = 'picture';
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(5; Picture2; Media)
        {
            Caption = 'picture2';
            DataClassification = OrganizationIdentifiableInformation;

        }
        field(6; picture3; Blob)
        {
            Caption = 'picture3';
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
