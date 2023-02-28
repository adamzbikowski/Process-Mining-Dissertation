SELECT DISTINCT
  prescriptions.HADM_ID AS patient,
  "Drug prescribed" AS activity,
  string(prescriptions.STARTDATE) AS timestamp,
  diagnoses_icd.icd9_code as ICD
  FROM 
    physionet-data.mimiciii_clinical.prescriptions,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    prescriptions.STARTDATE IS NOT NULL AND
    diagnoses_icd.HADM_ID = prescriptions.HADM_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases
