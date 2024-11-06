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

    procedure ExportCustomerData(Customer: Record Customer)
    var
        TmpExcelBuf: Record "Excel Buffer" temporary;
        CustRec: Label 'Customer record ';
        CustRecLb: label 'CustomerRecord %1 %2';
        Base64: text;
    begin
        TmpExcelBuf.Reset();
        TmpExcelBuf.DeleteAll();
        TmpExcelBuf.NewRow();

        TmpExcelBuf.AddColumn(Customer.FieldCaption("No."), false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Text);
        TmpExcelBuf.AddColumn(Customer.FieldCaption(Name), false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Text);
        TmpExcelBuf.AddColumn(Customer.FieldCaption("Location Code"), false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Text);
        TmpExcelBuf.AddColumn(Customer.FieldCaption(Contact), false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Text);
        TmpExcelBuf.AddColumn(Customer.FieldCaption(Balance), false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Text);

        if customer.FindSet() then
            repeat
                TmpExcelBuf.NewRow();
                TmpExcelBuf.AddColumn(Customer."No.", false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Number);
                TmpExcelBuf.AddColumn(Customer.Name, false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Text);
                TmpExcelBuf.AddColumn(Customer."Location Code", false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Text);
                TmpExcelBuf.AddColumn(Customer.Contact, false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Text);
                TmpExcelBuf.AddColumn(Customer.Balance, false, '', false, false, false, '', TmpExcelBuf."Cell Type"::Number);
            until customer.next() = 0;

        TmpExcelBuf.CreateNewBook(CustRec);
        TmpExcelBuf.WriteSheet(CustRec, CompanyName, UserId);
        TmpExcelBuf.CloseBook();
        TmpExcelBuf.SetFriendlyFilename(StrSubstNo(CustRecLb, CurrentDateTime, UserId));

    end;
}
