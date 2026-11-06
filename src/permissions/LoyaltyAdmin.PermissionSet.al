namespace DefaultPublisher.Hopverkefniproject2;

permissionset 50150 "Loyalty Admin"
{
    Assignable = true;
    Caption = 'Loyalty Program - Admin';

    Permissions =
        table "Loyalty Setup" = X,
        tabledata "Loyalty Setup" = RMID,
        table "Loyalty Ledger Entry" = X,
        tabledata "Loyalty Ledger Entry" = RMID,
        codeunit "Loyalty Management" = X,
        page "Loyalty Setup" = X,
        page "Loyalty Ledger Entries" = X,
        page "Loyalty Customer API" = X;
}