pageextension 50107 "Item Ext" extends "Item Card"
{
    actions
    {
        addfirst(processing)
        {
            action(importPicture)
            {
                Caption = 'Import Picture';
                Image = import;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    FileMgtMB: Codeunit "File Mgt MB";
                begin
                    FileMgtMB.ImportItemPicture(Rec);
                end;

            }
        }
    }
}
