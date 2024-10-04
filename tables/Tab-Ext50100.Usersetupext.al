/// <summary>
/// TableExtension User setup ext (ID 50100) extends Record User Setup.
/// </summary>
tableextension 50100 "User setup ext" extends "User Setup"
{
    LookupPageId = "User Setup";
    DrillDownPageId = "User Setup";
    fields
    {
        field(50100; "Journal Template Name"; Code[30])
        {
            Caption = 'Journal Template Name';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(50101; "Journal Batch Name"; Code[30])
        {
            Caption = 'Journal Batch Name';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Journal Template Name"));
        }
    }
}
