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
        if not WorkflowMgt.CanExecuteWorkflow(RecRef, GetWorkFlowCode(RUNWORKFLOWONSENDFORAPPROVALCODE, RecRef)) then begin
            Error(NoWorkflowEnabledErr);
        end;
        exit(true);
    end;

    /// <summary>
    /// GetWorkFlowCode.
    /// </summary>
    /// <param name="WorkFlowCode">Code[128].</param>
    /// <param name="RecRef">RecordRef.</param>
    /// <returns>Return value of type Code[128].</returns>
    procedure GetWorkFlowCode(WorkFlowCode: Code[128]; RecRef: RecordRef): Code[128]

    begin
        exit(DelChr(StrSubstNo(WorkFlowCode, RecRef.Name), '=', ' '));
    end;

    /// <summary>
    /// GetWorkFlowEventDescription.
    /// </summary>
    /// <param name="WorkFlowDesc">Text.</param>
    /// <param name="RecRef">RecordRef.</param>
    /// <returns>Return value of type Text.</returns>
    procedure GetWorkFlowEventDescription(WorkFlowDesc: Text; RecRef: RecordRef): Text

    begin
        exit(StrSubstNo(WorkFlowDesc, RecRef.Name));
    end;



    /// <summary>
    /// OnSendForApproval.
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

    //add event to the library

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    Var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        RecRef.Open(Database::"Custom Workflow Header");
        WorkflowEventHandling.AddEventToLibrary(GetWorkFlowCode(RUNWORKFLOWONSENDFORAPPROVALCODE, RecRef), DATABASE::"Custom Workflow Header",
           GetWorkFlowEventDescription(SendForApprovalEventDescTxt, RecRef), 0, false);
        WorkflowEventHandling.AddEventToLibrary(GetWorkFlowEventDescription(RUNWORKFLOWONCANCELFORAPPROVALCODE, RecRef), DATABASE::"Custom Workflow Header",
           GetWorkFlowEventDescription(CancelForApprovalEventDescTxt, RecRef), 0, false);
    end;

    //Handle the events

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Workflow Management", 'OnSendForApproval', '', false, false)]
    local procedure RunWorkflowOnSendForApproval(var RecRef: RecordRef)
    begin
        WorkflowMgt.HandleEvent(GetWorkFlowCode(RUNWORKFLOWONSENDFORAPPROVALCODE, RecRef), RecRef);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Workflow Management", 'OnCancelForApproval', '', false, false)]
    local procedure RunWorkflowOnCancelForApproval(var RecRef: RecordRef)
    begin
        WorkflowMgt.HandleEvent(GetWorkFlowCode(RUNWORKFLOWONCANCELFORAPPROVALCODE, RecRef), RecRef);
    end;

    var
        WorkflowMgt: Codeunit "Workflow Management";
        RUNWORKFLOWONSENDFORAPPROVALCODE: Label 'RUNWORKFLOWONSEND%1FORAPPROVALCODE';
        RUNWORKFLOWONCANCELFORAPPROVALCODE: Label 'RUNWORKFLOWONCANCEL%1FORAPPROVALCODE';
        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
        SendForApprovalEventDescTxt: Label 'Approval of a %1 is requested.';
        CancelForApprovalEventDescTxt: Label 'Approval of a %1 is Canceled.';
}
