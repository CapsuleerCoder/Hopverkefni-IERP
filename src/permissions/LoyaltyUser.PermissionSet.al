namespace DefaultPublisher.Hopverkefniproject2;

permissionset 50151 "Loyalty User"
{
    Assignable = true;
    Caption = 'Loyalty Program - User';

    Permissions =
        table "Loyalty Setup" = X,
        tabledata "Loyalty Setup" = R,
        table "Loyalty Ledger Entry" = X,
        tabledata "Loyalty Ledger Entry" = RI,
        codeunit "Loyalty Management" = X,
        page "Loyalty Setup" = X,
        page "Loyalty Ledger Entries" = X,
        page "Loyalty Customer API" = X;
}