/// <summary>
/// PageExtension Purchase Header ext (ID 50106) extends Record Purchase Lines.
/// </summary>
pageextension 50106 "Purchase Header ext" extends "Purchase Lines"
{
    actions
    {
        addfirst(Processing)
        {
            group(Custom)
            {
                Caption = 'Custom';
                action(filter)
                {
                    Caption = 'Filter';
                    Image = Filter;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger Onaction()
                    var
                        startDate: date;
                        EndDate: date;
                    begin
                        startDate := CalcDate('<-30D>', WorkDate());
                        EndDate := WorkDate();
                        rec.Reset();
                        // Rec.setrange("Order Date", startDate, EndDate);
                        rec.SetRange("Document Type", rec."Document Type"::Order);
                        rec.SetRange("Location Code", 'Green');
                        Rec.SetFilter(Quantity, '>%1', 100);
                        if rec.FindSet() then
                            Page.Run(Page::"Purchase Lines", Rec) else
                            Message('Nothing found');
                        CurrPage.Close();
                    end;
                }
            }
        }
    }
}
