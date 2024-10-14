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
    PromotedActionCategories = 'New,Process,Report,Approve,New Document,Request Approval,Cusomer,Navigate';

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
            action(Order)
            {
                Caption = 'Cust-sales';
                ToolTip = 'Import Records';
                Image = SalesPerson;
                Promoted = true;
                PromotedCategory = Category7;
                RunObject=page "Sales Orders";
            }
            action(Import)
            {
                Caption = 'Import Records';
                ToolTip = 'Import Records';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    CustOverviewMgt: Codeunit "Customer Overview Mgt";
                begin
                    CustOverviewMgt.Run();
                end;
            }
            group(Approvals)
            {
                action(control01)
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        Message('Approval request has been send');
                    end;
                }
                action(control02)
                {
                    Caption = 'Cancel Approval Request';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    Enabled = false;
                    PromotedCategory = Category6;
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        Message('Cancel request ');
                    end;
                }
            }
        }
        area(Creation)
        {
            group(Douments)
            {
                Caption = 'Document';
                action(SalesQuote)
                {
                    Caption = 'Sales Quote';
                    Image = NewSalesQuote;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ApplicationArea = all;
                    RunObject = page "Sales Quote";
                }
                action(SalesInvoice)
                {
                    Caption = 'Sales Invoice';
                    Image = NewSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ApplicationArea = all;
                    RunObject = page "Sales Invoice";
                }
                action(SalesOrder)
                {
                    Caption = 'Sales Order';
                    Image = NewSalesQuote;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ApplicationArea = all;
                    RunObject = page "Sales Order";
                }
            }
        }
    }
    var 
    customer: Record  customer;
}


