page 50105 wood
{
    ApplicationArea = All;
    Caption = 'wood';
    PageType = List;
    SourceTable = wood;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("primary key"; Rec."primary key")
                {
                    ToolTip = 'Specifies the value of the primary key field.', Comment = '%';
                }
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field.', Comment = '%';
                }
                field(status; Rec.status)
                {
                    ToolTip = 'Specifies the value of the status field.', Comment = '%';
                    StyleExpr = stylish;

                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        Segmentation: Codeunit Segmentation;
    begin
        stylish := Segmentation.ChangeColor(Rec);
    end;

    var
        stylish: text;
}
