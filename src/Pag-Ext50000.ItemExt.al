pageextension 50001 "Item Ext" extends "Item Card"
{
    actions
    {
        addafter("Marketing Text")
        {
            action("Prompt Action")
            {
                ApplicationArea = all;
                Caption = 'Prompt Action';

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Prompt Dialog", Rec);
                end;
            }
        }

        addlast(Promoted)
        {
            actionref("Marketing TextRef"; "Marketing Text") { }
        }

    }
}
