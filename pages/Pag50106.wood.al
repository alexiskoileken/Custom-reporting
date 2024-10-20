page 50106 wood
{
    ApplicationArea = All;
    Caption = 'wood';
    PageType = Card;
    SourceTable = wood;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("primary key"; Rec."primary key")
                {

                }

                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field.', Comment = '%';
                }
                field(status; Rec.status)
                {
                    ToolTip = 'Specifies the value of the status field.', Comment = '%';
                }
                field(picture; Rec.picture)
                {
                    ToolTip = 'Specifies the value of the picture field.', Comment = '%';
                    ApplicationArea = all;
                }
                field(Picture2; Rec.Picture2)
                {
                    ApplicationArea = all;
                }

            }
        }
        area(FactBoxes)
        {
            part(wood; Woodpart)
            {
                ApplicationArea = all;
            }
        }
    }

}
