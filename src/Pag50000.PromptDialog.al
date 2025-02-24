page 50001 "Prompt Dialog"
{
    ApplicationArea = All;
    Caption = 'Prompt Dialog ';
    Extensible = false;
    PageType = PromptDialog;
    PromptMode = Prompt;
    InstructionalText = 'This Basic Demo Prompt Dialog ';
    IsPreview = true;
    // DataCaptionExpression = ;
    SourceTable = Item;
    SourceTableTemporary = true;
    layout
    {
        area(Prompt)
        {
            field("EnterYourResponse"; UserResponse)
            {
                ApplicationArea = All;
                InstructionalText = 'please Enter your response';
                MultiLine = true;
                ShowCaption = false;
            }
        }

        area(Content)
        {

        }

        area(PromptOptions)
        {

        }
    }


    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                trigger OnAction()
                begin
                    Message('Generating the prompt response...');
                end;
            }


            systemaction(Attach)
            {
                trigger OnAction()
                begin
                    Message('Attaching the prompt response...');
                end;
            }
            systemaction(Regenerate)
            {
                trigger OnAction()
                begin
                    Message('Regenerating the prompt response...');
                end;
            }

            systemaction(Ok)
            { }
            systemaction(Cancel)
            { }


        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction in [CloseAction::Ok, CloseAction::LookupOK] then begin
            UserResponse := UserResponse;
            Message(UserResponse);
        end else
            exit(true);
    end;



    var
        Item: Record Item;
        Prompt: Enum "Prompt Interaction";
        UserResponse: Text[100];
        PromptMessage: Text[250];
        IsResponseReceived: Boolean;
}
