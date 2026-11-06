namespace DefaultPublisher.Hopverkefniproject2;
using Microsoft.Sales.Customer;

tableextension 50150 "Loyalty Customer Ext." extends Customer
{
    fields
    {
        field(50150; "Is Loyalty Member"; Boolean)
        {
            Caption = 'Is Loyalty Member';
            DataClassification = CustomerContent;
        }
        field(50151; "Loyalty Points"; Integer)
        {
            Caption = 'Loyalty Points';
            DataClassification = CustomerContent;
            Editable = false; // can not be manually changed, only through the loyalty system
        }
        field(50152; "Loyalty Credit"; Decimal)
        {
            Caption = 'Loyalty Credit';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50153; "Loyalty Tier"; Enum "Loyalty Tier")
        {
            Caption = 'Loyalty Tier';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}