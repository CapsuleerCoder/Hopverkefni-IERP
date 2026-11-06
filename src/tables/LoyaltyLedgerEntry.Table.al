namespace DefaultPublisher.Hopverkefniproject2;

using Microsoft.Sales.Customer;

table 50151 "Loyalty Ledger Entry"
{
    DataClassification = CustomerContent;
    Caption = 'Loyalty Ledger Entry';
    LookupPageId = "Loyalty Ledger Entries";
    DrillDownPageId = "Loyalty Ledger Entries";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(5; "Points Earned"; Integer)
        {
            Caption = 'Points Earned';
            DataClassification = CustomerContent;
        }
        field(6; "Credit Earned"; Decimal)
        {
            Caption = 'Credit Earned';
            DataClassification = CustomerContent;
        }
        field(7; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }
        field(8; "Sales Amount"; Decimal)
        {
            Caption = 'Total Sales Amount';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(CustomerKey; "Customer No.")
        {
        }
    }
}