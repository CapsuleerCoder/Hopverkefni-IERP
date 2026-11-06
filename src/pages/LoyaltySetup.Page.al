namespace DefaultPublisher.Hopverkefniproject2;

page 50150 "Loyalty Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Loyalty Setup";
    Caption = 'Loyalty Setup';

    //enforce single record
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General Settings';

                field("Credit Percentage"; Rec."Credit Percentage")
                {
                    ToolTip = 'Specifies the percentage of the sales margin that is converted into credit (default 5%)';
                }
                field("Sales Amount per Point"; Rec."Sales Amount per Point")
                {
                    ToolTip = 'Specifies the sales amount (excluding VAT) required to earn one loyalty point (default 1000)';
                }
            }
            group("Tier Thresholds")
            {
                Caption = 'Tier Thresholds';

                field("Silver Tier Threshold"; Rec."Silver Tier Threshold")
                {
                    ToolTip = 'Specifies the points required for the Silver tier.';
                }
                field("Gold Tier Threshold"; Rec."Gold Tier Threshold")
                {
                    ToolTip = 'Specifies the points required for the Gold tier.';
                }
                field("Platinum Tier Threshold"; Rec."Platinum Tier Threshold")
                {
                    ToolTip = 'Specifies the points required for the Platinum tier.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        //create setup record if it doesn't exist
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}