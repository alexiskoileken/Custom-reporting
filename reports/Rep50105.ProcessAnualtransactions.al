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
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                LineNo += 1;
                GenJnlLn.Init();
                GenJnlLn."Journal Template Name" := UserSetup."Journal Template Name";
                GenJnlLn."Journal Batch Name" := UserSetup."Journal Batch Name";
                GenJnlLn."Line No." := LineNo;
                GenJnlLn."Posting Date" := Today;
                GenJnlLn."Document No." := DocumentNo;
                GenJnlLn."Document Date" := Today;
                GenJnlLn."Account Type" := GenJnlLn."Account Type"::Customer;
                GenJnlLn.Validate("Account No.", Customer."No.");
                GenJnlLn.Description := 'Annual payment ';

            end;
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
                    field(DocumentNo; DocumentNo)
                    {
                        Caption = 'Document No.';
                        ApplicationArea = basic, suite;
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
        if DocumentNo = '' then Error(StrSubstNo(RequiredError, 'Document No.'));

        UserSetup.Get(UserId);
        userSetup.TestField("Journal Template Name");
        userSetup.TestField("Journal Batch Name");

        GenJnlLn.SetRange("Journal Template Name", UserSetup."Journal Template Name");
        GenJnlLn.SetRange("Journal Batch Name", UserSetup."Journal Batch Name");
        if GenJnlLn.FindFirst() then
            GenJnlLn.DeleteAll();
    end;


    var
        ExpenseGLAcc: code[20];
        FeesIncomeAcc: code[20];
        TaxGLacc: code[20];
        PaymentGLAcc: code[20];
        DocumentNo: code[20];
        GenJnlLn: Record "Gen. Journal Line";
        RequiredError: Label 'please enter the %1 field';
        LineNo: integer;
        UserSetup: Record "User Setup";

}
