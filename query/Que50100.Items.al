/// <summary>
/// Query Items (ID 50100).
/// </summary>
query 50100 Items
{
    Caption = 'Items';
    QueryType = Normal;
    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.") { }
            column(Description; Description) { }
            column("Type"; "Type") { }
            column(UnitPrice; "Unit Price") { }
            column(UnitCost; "Unit Cost") { }
            column(Inventory; Inventory) { }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
