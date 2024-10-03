# Healthcare Database Schema

This project contains a comprehensive **Healthcare Database Schema** that models various entities involved in a healthcare system. The schema is structured to manage data related to patients, prescriptions, treatments, pharmacies, claims, medicines, and insurance plans.

## Overview

The schema covers multiple components essential to a healthcare system, including:

- **Pharmacy**: Stores information about pharmacies, including the pharmacy name, contact details, and associated addresses.
- **Medicine**: Represents detailed information about medicines, including product names, company details, prices, discounts, and regulatory aspects.
- **Patient**: Contains patient-specific data such as personal details, treatments received, and prescriptions issued.
- **Treatment**: Tracks treatments given to patients, linked to diseases, claims, and prescriptions.
- **Disease**: Stores disease-related information.
- **Prescription**: Captures information about prescriptions, including the medicines prescribed, quantities, and the related pharmacy.
- **Claim**: Handles the tracking of medical claims associated with treatments, insurance plans, and balances.
- **Insurance**: Covers details related to insurance plans and insurance companies.

## ER Diagram

The Entity-Relationship (ER) diagram represents the structure of the database and the relationships between different entities.

![ER Diagram](https://github.com/imshamil23/SQL-Project/blob/main/Healthcare-Schema.png)


### Key Tables and Relationships

- **Pharmacy**:
  - Each pharmacy has an associated address and stores a list of medicines along with quantities and discounts.
  
- **Medicine**:
  - The `Keep` relationship links the pharmacy and medicine tables, showing which pharmacy keeps which medicine and in what quantity.

- **Patient**:
  - Contains patient information, linked to a `Person` entity that captures personal data like name, phone number, and gender.
  
- **Prescription**:
  - Each prescription is linked to a patient’s treatment and a pharmacy. The medicines prescribed are stored in the `Contain` table.

- **Treatment**:
  - Tracks the treatment of patients, linked to both the `Disease` table (for the diagnosed condition) and the `Claim` table for insurance claims.

- **Insurance**:
  - Information about insurance companies and insurance plans is captured, and linked to treatments through the claims process.

## Tables

Here are the primary tables and their key attributes:

1. **Pharmacy**: Stores pharmacy data.
   - `pharmacyID`, `pharmacyName`, `phone`, `addressID`

2. **Medicine**: Stores information about medicines.
   - `medicineID`, `companyName`, `productName`, `description`, `substanceName`, `productType`, `maxPrice`

3. **Patient**: Contains patient information.
   - `patientID`, `ssn`, `dob`

4. **Person**: Stores basic personal data.
   - `personID`, `personName`, `phoneNumber`, `gender`, `addressID`

5. **Prescription**: Records prescriptions issued to patients.
   - `prescriptionID`, `pharmacyID`, `treatmentID`

6. **Treatment**: Tracks treatments for patients.
   - `treatmentID`, `date`, `patientID`, `diseaseID`, `claimID`

7. **Claim**: Stores claim-related information.
   - `claimID`, `balance`, `UIN`

8. **InsurancePlan**: Tracks insurance plans for patients.
   - `UIN`, `planName`, `companyID`

9. **InsuranceCompany**: Stores information about insurance companies.
   - `companyID`, `companyName`, `addressID`

## Usage

You can utilize this schema for healthcare-related database management tasks such as:

- Managing patient records and treatments
- Handling prescriptions and pharmacy details
- Recording and processing medical claims
- Integrating with insurance companies and plans

## Future Enhancements

- Expanding the schema to include electronic health records (EHR).
- Incorporating patient billing details.
- Adding support for real-time appointment scheduling and telemedicine.
