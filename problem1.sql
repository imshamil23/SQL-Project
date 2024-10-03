#Problem Statement 1:  Some complaints have been lodged by patients that they have been 
#prescribed hospital-exclusive medicine that they can’t find elsewhere and facing problems due to that. Joshua, from the pharmacy
# management, wants to get a report of which pharmacies have prescribed hospital-exclusive medicines the most in 
#the years 2021 and 2022. Assist Joshua to generate the report so that
#the pharmacies who prescribe hospital-exclusive medicine more often are advised to avoid such practice if possible

create database problem1;
SELECT
    ph.pharmacyName AS PharmacyName,
    COUNT(pr.prescriptionID) AS NumberOfPrescriptions
FROM
    Prescription pr
JOIN
    Contain c ON pr.prescriptionID = c.prescriptionID
JOIN
    Medicine m ON c.medicineID = m.medicineID
JOIN
    Pharmacy ph ON pr.pharmacyID = ph.pharmacyID
GROUP BY
    ph.pharmacyName
ORDER BY
    NumberOfPrescriptions DESC;
 