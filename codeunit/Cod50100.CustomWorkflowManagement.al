/// <summary>
/// Codeunit Custom Workflow Management (ID 50100).
/// </summary>
codeunit 50100 "Custom Workflow Management"
{
    /// <summary>
    /// CheckApprovalsWorkflowEnabled.
    /// </summary>
    /// <param name="RecRef">VAR RecordRef.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure CheckApprovalsWorkflowEnabled(var RecRef: RecordRef): Boolean
    begin
        if not WorkflowMgt.CanExecuteWorkflow(RecRef, GetWorkflowCode(RUNWORKFLOWONSENDFORAPPROVALCODE, RecRef)) then begin
            Error(NoWorkflowEnabledErr);
        end;
        exit(true);
    end;



    /// <summary>
    /// GetWorkflowCode.
    /// </summary>
    /// <param name="WorkflowCode">code[128].</param>
    /// <param name="RecRef">RecordRef.</param>
    /// <returns>Return value of type Code[128].</returns>
    procedure GetWorkflowCode(WorkflowCode: code[128]; RecRef: RecordRef): Code[128]
    var
        myInt: Integer;
    begin
        exit(DelChr(StrSubstNo(WorkflowCode, RecRef.Name), '=', ''))
    end;

    /// <summary>
    /// OnSendVendorForApproval.
    /// </summary>
    /// <param name="RecRef">VAR RecordRef.</param>
    [IntegrationEvent(false, false)]
    procedure OnSendForApproval(var RecRef: RecordRef)
    begin
    end;

    /// <summary>
    /// OnCancelForApproval.
    /// </summary>
    /// <param name="RecRef">VAR RecordRef.</param>
    [IntegrationEvent(false, false)]
    procedure OnCancelForApproval(var RecRef: RecordRef)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        RecRef.Open(Database::"Custom Workflow Header");
        WorkflowEventHandling.AddEventToLibrary(GetWorkflowCode(RUNWORKFLOWONSENDFORAPPROVALCODE, RecRef), DATABASE::"Custom Workflow Header",
         GetWorkflowDescriptionText(SendForApprovalEventDescTxt, RecRef), 0, false);
        WorkflowEventHandling.AddEventToLibrary(GetWorkflowCode(RUNWORKFLOWONCANCELFORAPPROVALCODE, RecRef), DATABASE::"Custom Workflow Header",
          GetWorkflowDescriptionText(CancelForApprovalEventDescTxt, RecRef), 0, false);
    end;

    /// <summary>
    /// GetWorkflowDescriptionText.
    /// </summary>
    /// <param name="WorkflowDescriptionTxt">Text[250].</param>
    /// <param name="RecRef">RecordRef.</param>
    /// <returns>Return value of type Text.</returns>
    procedure GetWorkflowDescriptionText(WorkflowDescriptionTxt: Text[250]; RecRef: RecordRef): Text
    var
        myInt: Integer;
    begin
        exit(StrSubstNo(WorkflowDescriptionTxt, RecRef.Name))
    end;

    /// <summary>
    /// RunWorkflowOnSendForApproval.
    /// </summary>
    /// <param name="RecRef">RecordRef.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Workflow Management", 'OnSendForApproval', '', false, false)]
    procedure RunWorkflowOnSendForApproval(RecRef: RecordRef)
    begin
        WorkflowMgt.HandleEvent(GetWorkflowCode(RUNWORKFLOWONSENDFORAPPROVALCODE, RecRef), RecRef);
    end;


    /// <summary>
    /// RunWorkflowOnCancelForApproval.
    /// </summary>
    /// <param name="Var RecRef">RecordRef.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Workflow Management", 'OnSendForApproval', '', false, false)]
    procedure RunWorkflowOnCancelForApproval(Var RecRef: RecordRef)
    begin
        WorkflowMgt.HandleEvent(GetWorkflowCode(RUNWORKFLOWONCANCELFORAPPROVALCODE, RecRef), RecRef);
    end;

    var
        WorkflowMgt: Codeunit "Workflow Management";
        RUNWORKFLOWONSENDFORAPPROVALCODE: Label 'RUNWORKFLOWONSEND%1FORAPPROVALCODE';
        RUNWORKFLOWONCANCELFORAPPROVALCODE: Label 'RUNWORKFLOWONCANCEL%1FORAPPROVALCODE';
        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
        SendForApprovalEventDescTxt: Label 'Approval of a %1 is requested.';
        CancelForApprovalEventDescTxt: Label 'Approval of a %1 is Canceled.';
}
