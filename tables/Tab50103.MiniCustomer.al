/// <summary>
/// Table Mini Customer (ID 50103).
/// </summary>
table 50103 "Mini Customer"
{
    Caption = 'Mini Customer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No"; Code[20])
        {
            Caption = 'Customer No';
        }
        field(2; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(3; phoneNumber; Text[30])
        {
            Caption = 'phoneNumber';
        }
        field(4; city; Text[30])
        {
            Caption = 'city';
        }
        field(5; balance; Decimal)
        {
            Caption = 'balance';
        }
    }
    keys
    {
        key(PK; "Customer No")
        {
            Clustered = true;
        }
    }
}
