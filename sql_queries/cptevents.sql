SELECT DISTINCT
  cptevents.HADM_ID AS patient,
  cptevents.SECTIONHEADER AS activity,
  string(cptevents.CHARTDATE) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.cptevents,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE 
    cptevents.CHARTDATE IS NOT NULL AND
    diagnoses_icd.HADM_ID = cptevents.HADM_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases