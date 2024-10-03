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
    var
        ExpenseGLAcc: code[20];
        FeesIncomeAcc: code[20];
        TaxGLacc: code[20];
        PaymentGLAcc: code[20];

}
