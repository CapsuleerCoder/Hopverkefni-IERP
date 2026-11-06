namespace DefaultPublisher.Hopverkefniproject2;

using Microsoft.Sales.Customer;

page 50153 "Loyalty Customer API"
{
    PageType = API;
    APIPublisher = 'hopur10';
    APIGroup = 'loyalty';
    APIVersion = 'v1.0';
    EntityName = 'loyaltyCustomer';
    EntitySetName = 'loyaltyCustomers';
    SourceTable = Customer;
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'ID';
                    Editable = false;
                }
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(email; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(isLoyaltyMember; Rec."Is Loyalty Member")
                {
                    Caption = 'Is Loyalty Member';
                }
                field(loyaltyPoints; Rec."Loyalty Points")
                {
                    Caption = 'Loyalty Points';
                    Editable = false;
                }
                field(loyaltyCredit; Rec."Loyalty Credit")
                {
                    Caption = 'Loyalty Credit';
                    Editable = false;
                }
                field(loyaltyTier; Rec."Loyalty Tier")
                {
                    Caption = 'Loyalty Tier';
                    Editable = false;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Is Loyalty Member" := true;
    end;
}