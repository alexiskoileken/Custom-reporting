/// <summary>
/// PageExtension User Setup ext (ID 50104) extends Record User Setup.
/// </summary>
pageextension 50104 "User Setup ext" extends "User Setup"
{
    layout
    {
        addafter(PhoneNo)
        {
            field("Template Name"; rec."Journal Template Name")
            {
                ToolTip = 'Specifies the value of the Journal template name', Comment = '%';
            }
            field("Batch Name"; rec."Journal Batch Name")
            {
                ToolTip = 'Specifies the value of the Journal Batch name', Comment = '%';
            }
        }
    }
}
