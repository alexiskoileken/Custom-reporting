/// <summary>
/// PageExtension Accountant RC ext (ID 50100) extends Record Accountant Role Center.
/// </summary>
pageextension 50103 "Accountant RC ext" extends "Accountant Role Center"
{
    layout
    {
        modify(ApprovalsActivities)
        {
            visible = false;
        }
        addafter(Control1902304208)
        {
            part("Users sales"; "Accountant Rc part")
            {
                ApplicationArea = basic, suite;
            }
        }
    }
    actions
    {
        addbefore("Cash Flow")
        {
            group("BankReport")
            {
                action("Bank Report List")
                {
                    Caption = 'Bank Report List';
                    ApplicationArea = basic, suite;
                    Image = Report;
                    RunObject = report "Bank list Report";
                }
                action("G/L Trial Balance")
                {
                    Caption = 'G/L Trial Balance';
                    ApplicationArea = basic, suite;
                    Image = Report;
                    RunObject = report "Chart of Acc";
                }

            }
        }
    }
}
