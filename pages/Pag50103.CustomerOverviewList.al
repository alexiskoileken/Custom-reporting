/// <summary>
/// Page Customer Overview List (ID 50103).
/// </summary>
page 50104 "Customers Overview List"
{
    ApplicationArea = All;
    Caption = 'Customer Overview List';
    PageType = List;
    SourceTable = "Customer Overview";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ToolTip = 'Specifies the value of the EntryNo field.', Comment = '%';
                }
                field(CustomerNo; Rec.CustomerNo)
                {
                    ToolTip = 'Specifies the value of the CustomerNo field.', Comment = '%';
                }
                field(CustomerName; Rec.CustomerName)
                {
                    ToolTip = 'Specifies the value of the CustomerName field.', Comment = '%';
                }
                field(SourceCode; Rec.SourceCode)
                {
                    ToolTip = 'Specifies the value of the SourceCode field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ToolTip = 'Specifies the value of the LastRunDate field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Import)
            {
                Caption = 'Import Records';
                ToolTip = 'Import Records';
                Image = Import;
                trigger OnAction()
                var
                    CustOverviewMgt: Codeunit "Customer Overview Mgt";
                begin
                    CustOverviewMgt.Run();
                end;
            }
        }
    }
}


 