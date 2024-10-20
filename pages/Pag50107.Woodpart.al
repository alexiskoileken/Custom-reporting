/// <summary>
/// Page Woodpart (ID 50107).
/// </summary>
page 50107 Woodpart
{
    ApplicationArea = All;
    Caption = 'Woodpart';
    PageType = CardPart;
    SourceTable = wood;

    layout
    {
        area(Content)
        {
            field(picture; Rec.picture)
            {
                ApplicationArea = all;

            }
        }

    }
    actions
    {
        area(Processing)
        {

            action(Import)
            {
                Caption = 'Import';
                Image = Import;
                ApplicationArea = all;
                trigger OnAction()
                var
                    FromFileName: text;
                    InstreamPic: InStream;
                    wood: Record wood;
                begin
                        if UploadIntoStream('Import', '', 'All files(*.*)|*.*', FromFileName, InstreamPic) then begin
                            Rec.picture.ImportStream(InstreamPic, FromFileName);
                            Rec.Modify(true)
                        end;
                end;
            }
            action(Export)
            {
                Caption = 'Export';
                Image = Export;
                ApplicationArea = all;

                trigger OnAction()
                begin

                end;
            }
           
        }

    }
}
