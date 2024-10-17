/// <summary>
/// Report Items (ID 50106).
/// </summary>
report 50106 Items
{
    Caption = 'Items';

    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;


    dataset
    {
        dataitem(Integer; Integer)
        {
            column(ItemNo; Items.No)
            { }
            column(Description; Items.Description)
            { }
            column(Type; Items.Type)
            { }
            column(UnitCost; Items.UnitCost)
            { }
            column(UnitPrice; Items.UnitPrice)
            { }
            column(Inventory; Items.Inventory)
            { }

            trigger OnPreDataItem()
            begin
                Items.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not Items.Read() then
                    CurrReport.Break();
            end;
        }
    }
    var
        Items: Query Items;
}
