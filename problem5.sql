#Generate a report for Jhonny listing the total quantity of 
#Tax Criteria I medicine prescribed by each pharmacy in Arizona for treatments in 2021. 


create database problem5;

select * from pharmacy;
select * from Address;
select * from Prescription;
select * from Contain;
select * from Medicine;
select * from Treatment;

SELECT 
    ph.pharmacyName,
    SUM(c.Quantity) AS TotalQuantity
FROM 
    Pharmacy ph
JOIN 
    Address a ON ph.addressID = a.addressID
JOIN 
    Prescription pr ON pr.pharmacyID = ph.pharmacyID
JOIN 
    Contain c ON c.prescriptionID = pr.prescriptionID
JOIN 
    Medicine m ON m.medicineID = c.medicineID
JOIN 
    Treatment t ON t.treatmentID = pr.treatmentID
WHERE 
    a.state = 'AZ' AND 
    m.taxCriteria = 'I' AND 
    YEAR(t.date) = 2021
GROUP BY 
    ph.pharmacyName;
    
    
