/// <summary>
/// Page Accountant Rc part (ID 50100).
/// </summary>
page 50100 "Accountant Rc part"
{
    ApplicationArea = All;
    Caption = 'Accountant Rc part';
    PageType = CardPart;
    SourceTable = "Acc rc cue";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            cuegroup(users)
            {
                field("No of logged users"; Rec."No of logged users")
                {
                    Caption = 'No of logged users';
                    ApplicationArea = basic, suite;
                    DrillDownPageId = "Concurrent Session List";
                }
            }
        }
    }
}

