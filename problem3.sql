#Problem Statement 3: Insurance companies want to assess the performance of their insurance plans.
#Generate a report that shows each insurance company's name with their most and least claimed insurance plans.
 
#This report shows each insurance company's name with their most and least claimed insurance plans.

WITH PlanClaims AS (
    SELECT
        ip.planName,
        ic.companyName,
        COUNT(t.treatmentID) AS NumberOfClaims
    FROM
        InsurancePlan ip
    JOIN
        InsuranceCompany ic ON ip.companyID = ic.companyID
    JOIN
        Claim c ON ip.UIN = c.UIN
    JOIN
        Treatment t ON c.claimID = t.claimID
    GROUP BY
        ip.planName, ic.companyName
),
RankedPlans AS (
    SELECT
        companyName,
        planName,
        NumberOfClaims,
        RANK() OVER (PARTITION BY companyName ORDER BY NumberOfClaims DESC) AS rank_desc,
        RANK() OVER (PARTITION BY companyName ORDER BY NumberOfClaims ASC) AS rank_asc
    FROM
        PlanClaims
)
SELECT
    companyName,
    MAX(CASE WHEN rank_desc = 1 THEN planName END) AS MostClaimedPlan,
    MAX(CASE WHEN rank_asc = 1 THEN planName END) AS LeastClaimedPlan
FROM
    RankedPlans
GROUP BY
    companyName;