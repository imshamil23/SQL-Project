#Create a report detailing each insurance plan, its issuing company, and the number of claims made for treatments under each plan.



CREATE DATABASE problem2;

SELECT * FROM InsuranceCompany;
SELECT * FROM InsurancePlan;
SELECT * FROM Claim;
SELECT * FROM Treatment;


    
    SELECT
    ip.planName AS InsurancePlan,
    ic.companyName AS InsuranceCompany,
    COUNT(t.treatmentID) AS NumberOfTreatmentsClaimed
FROM
    InsurancePlan ip
JOIN
    InsuranceCompany ic ON ip.companyID = ic.companyID
JOIN
    Claim c ON ip.UIN = c.UIN
JOIN
    Treatment t ON c.claimID = t.claimID
GROUP BY
    ip.planName, ic.companyName;
    
#1-joint tablesInsurancePlan with InsuranceCompany using companyID.
#Claim with Treatment using claimID.
#Treatment with InsurancePlan using UIN.
#2-Group the data:
#Group the results by planName and companyName.
#3-Count the number of treatments:
#Use the COUNT() function on treatmentID to get the number of treatments for each insurance plan.
    