/// <summary>
/// Report Process Anual transactions (ID 50105).
/// </summary>
report 50105 "Process Anual transactions"
{
    ApplicationArea = All;
    Caption = 'Process Anual transactions';
    UsageCategory = Tasks;
    processingOnly = true;
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Options';
            column(No; "No.")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(filters)
                {
                    field(ExpenseGLAcc; ExpenseGLAcc)
                    {
                        ApplicationArea = basic, suite;
                        caption = 'ExpenseGlAcc';
                        TableRelation = "G/L Account" where("Direct Posting" = const(true));
                    }
                    field(FeesIncomeAcc; FeesIncomeAcc)
                    {
                        ApplicationArea = basic, suite;
                        caption = 'FeesIncomeAcc';
                        TableRelation = "G/L Account" where("Direct Posting" = const(true));
                    }
                    field(TaxGLacc; TaxGLacc)
                    {
                        ApplicationArea = basic, suite;
                        caption = 'TaxGLacc';
                        TableRelation = "G/L Account" where("Direct Posting" = const(true));
                    }
                    field(PaymentGLAcc; PaymentGLAcc)
                    {
                        ApplicationArea = basic, suite;
                        caption = 'PaymentGLAcc';
                        TableRelation = "G/L Account" where("Direct Posting" = const(true));
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
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        if ExpenseGLAcc = '' then Error(StrSubstNo(RequiredError, 'Expense G/L Acc'));
        if FeesIncomeAcc = '' then Error(StrSubstNo(RequiredError, 'Fees Income G/L Acc'));
        if TaxGLacc = '' then Error(StrSubstNo(RequiredError, 'Tax G/L acc'));
        if ExpenseGLAcc = '' then Error(StrSubstNo(RequiredError, 'Expense G/L Acc'));
        UserSetup.Get(UserId);
        userSetup.TestField("Journal Template Name");
        userSetup.TestField("Journal Batch Name");
    end;


    var
        ExpenseGLAcc: code[20];
        FeesIncomeAcc: code[20];
        TaxGLacc: code[20];
        PaymentGLAcc: code[20];
        GenJnlLn: Record "Gen. Journal Line";
        RequiredError: Label 'please enter the %1 field';
        LineNo: integer;
        UserSetup: Record "User Setup";

}
