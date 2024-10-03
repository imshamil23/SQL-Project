
#Generate a report showing each state’s name, the number of registered people, 
#the number of registered patients, and the people-to-patient ratio, sorted by the ratio.

create database problem4;

SELECT
    a.state AS StateName,
    COUNT(DISTINCT p.personID) AS NumberOfRegisteredPeople,
    COUNT(DISTINCT pat.patientID) AS NumberOfRegisteredPatients,
    CASE 
        WHEN COUNT(DISTINCT pat.patientID) = 0 THEN 0
        ELSE COUNT(DISTINCT p.personID) / COUNT(DISTINCT pat.patientID)
    END AS PeopleToPatientRatio
FROM
    Person p
JOIN
    Address a ON p.addressID = a.addressID
LEFT JOIN
    Patient pat ON p.personID = pat.patientID
GROUP BY
    a.state
ORDER BY
    PeopleToPatientRatio DESC;

