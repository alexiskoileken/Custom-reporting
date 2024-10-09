/// <summary>
/// Page Mini Customer list (ID 50103).
/// </summary>
page 50103 "Mini Customer list"
{
    ApplicationArea = All;
    Caption = 'Mini Customer list';
    PageType = List;
    SourceTable = "Mini Customer";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer No"; Rec."Customer No")
                {
                    ToolTip = 'Specifies the value of the Customer No field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field(phoneNumber; Rec.phoneNumber)
                {
                    ToolTip = 'Specifies the value of the phoneNumber field.', Comment = '%';
                }
                field(city; Rec.city)
                {
                    ToolTip = 'Specifies the value of the city field.', Comment = '%';
                }
                field(balance; Rec.balance)
                {
                    ToolTip = 'Specifies the value of the balance field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("Mini Customer")
            {
                Caption = 'Mini Customer';
                action(Import)
                {
                    Caption = 'Import Records';
                    ToolTip = 'Importing customer Records';
                    Image = ImportDatabase;
                    Promoted = true;
                    PromotedCategory = Process;


                    trigger OnAction()
                    var
                        MiniCust: Codeunit "Mini Customer ";
                    begin
                        MiniCust.Run();
                        Message('Record Added successfully');
                    end;
                }
                action(Delete)
                {
                    Caption = 'Delete Records';
                    ToolTip = 'Deleting Minicustomer Records';
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Process;


                    trigger OnAction()

                    begin
                        MiniCust.DeleteAll();
                        Message('Deleted Succesfully');
                    end;
                }
            }
        }
    }
    var
        MiniCust: Record "Mini Customer";
}
