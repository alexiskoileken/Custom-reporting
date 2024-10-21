/// <summary>
/// Codeunit File Mgt MB (ID 50104).
/// </summary>
codeunit 50104 "File Mgt MB"
{
    procedure ImportItemPicture(item: Record Item)
    var
        PicInstream: InStream;
        FromFileName: Text;
        OvverideImageMsg: Label 'The Existing Picture will be replaced.Continue?';
    begin
        with item do begin
            if Picture.Count() > 0 then
                if not Confirm(OvverideImageMsg) then
                    exit;
            if File.UploadIntoStream('Import', '', 'All files(*.*)|*.*', FromFileName, PicInstream) then begin
                Picture.ImportStream(PicInstream, FromFileName);
                Clear(Picture);
                Modify(true)
            end;
        end;
    end;
}
