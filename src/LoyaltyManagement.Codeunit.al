namespace DefaultPublisher.Hopverkefniproject2;

using Microsoft.Sales.Document;
using Microsoft.Sales.History;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Posting;
using Microsoft.Finance.GeneralLedger.Posting;

codeunit 50150 "Loyalty Management"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20])
    var
        Customer: Record Customer;
        LoyaltySetup: Record "Loyalty Setup";
        SalesInvLine: Record "Sales Invoice Line";
        LoyaltyLedger: Record "Loyalty Ledger Entry";
        TotalSalesAmount: Decimal;
        TotalMargin: Decimal;
        PointsEarned: Integer;
        CreditEarned: Decimal;
    begin
        if SalesInvHdrNo = '' then
            exit;

        if not Customer.Get(SalesHeader."Sell-to Customer No.") then
            exit;

        if not Customer."Is Loyalty Member" then
            exit;

        if not LoyaltySetup.Get() then
            exit;

        SalesInvLine.SetRange("Document No.", SalesInvHdrNo);
        SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
        if SalesInvLine.FindSet() then begin
            repeat
                TotalSalesAmount += SalesInvLine.Amount;
                TotalMargin += SalesInvLine.Amount - (SalesInvLine.Quantity * SalesInvLine."Unit Cost (LCY)");
            until SalesInvLine.Next() = 0;
        end;

        if LoyaltySetup."Sales Amount per Point" > 0 then
            PointsEarned := Round(TotalSalesAmount / LoyaltySetup."Sales Amount per Point", 1, '<')
        else
            PointsEarned := 0;

        CreditEarned := TotalMargin * (LoyaltySetup."Credit Percentage" / 100);

        if CreditEarned < 0 then
            CreditEarned := 0;
        if PointsEarned < 0 then
            PointsEarned := 0;

        if (PointsEarned = 0) and (CreditEarned = 0) then
            exit;

        LoyaltyLedger.Init();
        LoyaltyLedger."Customer No." := Customer."No.";
        LoyaltyLedger."Posting Date" := SalesHeader."Posting Date";
        LoyaltyLedger."Document No." := SalesInvHdrNo;
        LoyaltyLedger."Points Earned" := PointsEarned;
        LoyaltyLedger."Credit Earned" := CreditEarned;
        LoyaltyLedger."Sales Amount" := TotalSalesAmount;
        LoyaltyLedger.Insert(true);

        Customer."Loyalty Points" += PointsEarned;
        Customer."Loyalty Credit" += CreditEarned;

        Customer."Loyalty Tier" := Customer."Loyalty Tier"::Basic;

        if Customer."Loyalty Points" >= LoyaltySetup."Silver Tier Threshold" then
            Customer."Loyalty Tier" := Customer."Loyalty Tier"::Silver;

        if Customer."Loyalty Points" >= LoyaltySetup."Gold Tier Threshold" then
            Customer."Loyalty Tier" := Customer."Loyalty Tier"::Gold;

        if Customer."Loyalty Points" >= LoyaltySetup."Platinum Tier Threshold" then
            Customer."Loyalty Tier" := Customer."Loyalty Tier"::Platinum;

        Customer.Modify();
    end;
}