SELECT DISTINCT
  services.HADM_ID AS patient,
  "Transfer" AS activity,
  string(services.TRANSFERTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.services,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    services.TRANSFERTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = services.HADM_ID
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases

  