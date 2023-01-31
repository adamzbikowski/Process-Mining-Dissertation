SELECT DISTINCT
  cptevents.HADM_ID AS patient,
  -- 'admission' AS category,
  cptevents.SECTIONHEADER AS activity,
  string(cptevents.CHARTDATE) AS timestamp,
  diagnoses_icd.icd9_code as ICD
  FROM 
    physionet-data.mimiciii_clinical.cptevents,
    physionet-data.mimiciii_clinical.diagnoses_icd
    -- physionet-data.mimiciii_clinical.d_items
  WHERE 
    cptevents.CHARTDATE IS NOT NULL AND
    diagnoses_icd.HADM_ID = cptevents.HADM_ID
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    -- AND cptevents.ITEMID = d_items.ITEMID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases