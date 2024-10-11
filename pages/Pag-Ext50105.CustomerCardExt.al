/// <summary>
/// PageExtension Customer Card Ext (ID 50105) extends Record Customer Card.
/// </summary>
pageextension 50105 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(Segment; Rec.Segment)
            {
                ApplicationArea = basic, suite;
                ToolTip = 'Specifies the segment state  on customers';
            }
        }
    }
    actions
    {
        addlast(Workflow)
        {
            action(UpdateCreditLimit)
            {
                caption = 'Update Credit Limit';
                Tooltip = 'Update Credit Limit';
                image = CalculateCost;
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    CallUpdateCreditLimit();
                end;
            }
        }

    }
    local procedure CallUpdateCreditLimit()
    var
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;

    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        if CreditLimitCalculated = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
        end;
        if GuiAllowed then
            if not Confirm(AreYouSureQst, false) then
                exit;
        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            Message(CreditLimitROundedTxt, CreditLimitActual);

    end;

    var
        AreYouSureQst: label 'Are you sure that you want to set the %1 to %2?';
        CreditLimitRoundedTxt: label 'The credit limit was rounded to %1 to comply with company policies.';

        CreditLimitUpToDateTxt: label 'The credit limit is up to date.';
        

    trigger OnOpenPage()
    var
        Segmentation: Codeunit Segmentation;
    begin
        Segmentation.Run();
    end;
}
