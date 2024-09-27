/// <summary>
/// Table Custom Workflow Header (ID 50101).
/// </summary>
table 50101 "Custom Workflow Header"
{
    Caption = 'Custom Workflow Header';
    DataClassification = ToBeClassified;
    LookupPageId = "Custom Workflow List";
    DrillDownPageId = "Custom Workflow List";

    fields
    {
        field(1; "N0."; Code[20])
        {
            Caption = 'N0.';
            Editable = false;
        }
        field(2; "Description "; Text[100])
        {
            Caption = 'Description ';
        }
        field(3; status; Enum "Custom Approval ")
        {
            Caption = 'status';
            Editable = false;
        }
        field(4; "No series"; Code[20])
        {
            Caption = 'No series';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "N0.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        myInt: Integer;
    begin
        if "N0." = '' then begin
            NoSeriesMgt.InitSeries('MCW', "N0.", 0D, "N0.", "No series");
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
