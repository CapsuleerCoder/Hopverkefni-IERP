namespace DefaultPublisher.Hopverkefniproject2;

page 50152 "Loyalty Ledger Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "Loyalty Ledger Entry";
    Caption = 'Loyalty Ledger Entries';

    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.") { }
                field("Customer Name"; Rec."Customer Name") { } // Nafnið beint á eftir Entry No.
                field("Posting Date"; Rec."Posting Date") { }
                field("Customer No."; Rec."Customer No.") { }
                field("Document No."; Rec."Document No.") { }
                field("Points Earned"; Rec."Points Earned") { }
                field("Credit Earned"; Rec."Credit Earned") { }
                field("Sales Amount"; Rec."Sales Amount") { } // Heildarupphæðin aftast
            }
        }
    }
}