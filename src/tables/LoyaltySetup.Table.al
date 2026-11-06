namespace DefaultPublisher.Hopverkefniproject2;

table 50150 "Loyalty Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Loyalty Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Credit Percentage"; Decimal)
        {
            Caption = 'Credit Percentage';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
            InitValue = 5;
        }
        field(3; "Sales Amount per Point"; Decimal)
        {
            Caption = 'Sales Amount per Point';
            DataClassification = CustomerContent;
            MinValue = 0;
            InitValue = 1000;
        }
        field(4; "Silver Tier Threshold"; Integer)
        {
            Caption = 'Silver Tier Threshold';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(5; "Gold Tier Threshold"; Integer)
        {
            Caption = 'Gold Tier Threshold';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(6; "Platinum Tier Threshold"; Integer)
        {
            Caption = 'Platinum Tier Threshold';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}