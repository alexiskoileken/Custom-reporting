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
        addbefore(ApprovalsActivities)
        {
            part(AccountantPart; "Accountant Rc part")
            {
                applicationarea = basic, suite;

            }
        }
    }
    actions
    {
        addbefore("G/L Reports")
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
            }
        }
    }
}
