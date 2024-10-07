/// <summary>
/// Page Accountant Rc part (ID 50100).
/// </summary>
page 50100 "Accountant Rc part"
{
    ApplicationArea = All;
    Caption = 'Accountant Rc part';
    PageType = CardPart;
    SourceTable = "Acc rc cue";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            cuegroup(users)
            {
                field("No of logged users"; Rec."No of logged users")
                {
                    Caption = 'No of logged users';
                    ApplicationArea = basic, suite;
                    DrillDownPageId = "Concurrent Session List";
                }
                field("biggest Sales"; Rec."biggest Sales")
                {
                    ApplicationArea = basic, suite;
                    Caption = 'Biggest Sales Order';
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        SalesLn: Record "Sales Line";
                    begin
                        SalesLn.Reset();
                        SalesLn.SetRange("Document Type", SalesLn."Document Type"::Order);
                        SalesLn.SetFilter(Amount, '>=%1', 0);
                        SalesLn.Ascending(false);
                        if SalesLn.FindSet() then
                            Page.Run(Page::"Sales Lines", SalesLn);
                    end;

                }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        Rec."biggest Sales" := Rec.GetBiggestSales();
    end;
}

