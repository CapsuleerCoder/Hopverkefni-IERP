namespace DefaultPublisher.Hopverkefniproject2;
using Microsoft.Sales.Customer;

pageextension 50150 "Loyalty Customer Card Ext." extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("Loyalty Program")
            {
                Caption = 'Loyalty Program';

                field("Is Loyalty Member"; Rec."Is Loyalty Member")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the customer is a member of the loyalty program.';
                }
                field("Loyalty Tier"; Rec."Loyalty Tier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s current loyalty tier.';
                }
                field("Loyalty Points"; Rec."Loyalty Points")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s accumulated loyalty points.';
                }
                field("Loyalty Credit"; Rec."Loyalty Credit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s available loyalty credit.';
                }
            }
        }
    }
}