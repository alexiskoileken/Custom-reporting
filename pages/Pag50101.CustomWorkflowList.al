/// <summary>
/// Page Custom Workflow List (ID 50101).
/// </summary>
page 50101 "Custom Workflow List"
{
    ApplicationArea = All;
    Caption = 'Custom Workflow List';
    PageType = List;
    SourceTable = "Custom Workflow Header";
    UsageCategory = Lists;
    CardPageId = "Custom workflow Card";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("N0."; Rec."N0.")
                {
                    ToolTip = 'Specifies the value of the N0. field.', Comment = '%';
                }
                field("Description "; Rec."Description ")
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(status; Rec.status)
                {
                    ToolTip = 'Specifies the value of the status field.', Comment = '%';
                }
            }
        }
    }
}
