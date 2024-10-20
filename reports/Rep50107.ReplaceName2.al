/// <summary>
/// Report ReplaceName2 (ID 50107).
/// </summary>
report 50107 ReplaceName2
{
    ApplicationArea = All;
    Caption = 'ReplaceName2';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem()
            begin
                clear(Customer);
                clear(Counter);
                if not ReplaceExisting then
                    Customer.SetRange("Name 2", '');
            end;

            trigger OnAfterGetRecord();
            begin
                if Customer2.get(Customer."No.") then begin
                    Customer2."Name 2" := Name2ToApply;
                    Customer2.Modify;
                    Counter += 1;
                end;
            end;

            trigger OnPostDataItem();
            begin
                Message('Ready!, %1 Customers were updated.', Counter);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(options)
                {
                    field(Name2ToApply; Name2ToApply)
                    {
                        ApplicationArea = all;
                        ToolTip = 'specifies then name to apply';
                    }
                    field(ReplaceExisting; ReplaceExisting)
                    {
                        ApplicationArea = all;

                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        Name2ToApply: Text;
        Customer2: Record Customer;
        ReplaceExisting: Boolean;
        Counter: Integer;
}
