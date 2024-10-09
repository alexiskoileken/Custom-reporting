/// <summary>
/// Codeunit Customer Overview Mgt (ID 50101).
/// </summary>
codeunit 50101 "Customer Overview Mgt"
{
    var
        CustOverview: Record "Customer Overview";
        Customer: Record Customer;
        SrcCode: Record "Source Code";
        GLEntry: Record "G/L Entry";
        NextEntryNo: Integer;

    trigger OnRun()
    var
        myInt: Integer;
    begin
        if CustOverview.FindLast() then
            NextEntryNo := CustOverview.EntryNo + 1
        else
            NextEntryNo := 1;
        if SrcCode.FindSet() then
            repeat
                if Customer.FindSet() then
                    repeat
                        GLEntry.SetRange("Source Type", GLEntry."Source Type"::Customer);
                        GLEntry.SetRange("Source Code", SrcCode.Code);
                        GLEntry.SetRange("Source No.", Customer."No.");
                        if GLEntry.FindSet() then begin
                            GLEntry.CalcSums(GLEntry.Amount);
                            CustOverview.EntryNo := NextEntryNo;
                            CustOverview.CustomerNo := Customer."No.";
                            CustOverview.CustomerName := Customer.Name;
                            CustOverview.SourceCode := SrcCode.Code;
                            CustOverview.Amount := GLEntry.Amount;
                            CustOverview.LastRunDate := CurrentDateTime();
                            CustOverview.Insert();
                            NextEntryNo += 1;
                        end;
                    until Customer.Next() = 0;
            until SrcCode.Next() = 0
    end;

}
