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

    var
        WorkflowMgt: Codeunit "Workflow Management";
        RUNWORKFLOWONSENDFORAPPROVALCODE: Label 'RUNWORKFLOWONSEND%1FORAPPROVALCODE';
        RUNWORKFLOWONCANCELFORAPPROVALCODE: Label 'RUNWORKFLOWONCANCEL%1FORAPPROVALCODE';
        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
}
