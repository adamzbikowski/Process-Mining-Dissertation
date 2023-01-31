SELECT DISTINCT
  datetimeevents.HADM_ID AS patient,
  -- 'admission' AS category,
  d_items.LABEL AS activity,
  -- datetimeevents.ITEMID AS ID,
  string(datetimeevents.CHARTTIME) AS timestamp,
  diagnoses_icd.icd9_code as ICD
  FROM 
    physionet-data.mimiciii_clinical.datetimeevents,
    physionet-data.mimiciii_clinical.diagnoses_icd,
    physionet-data.mimiciii_clinical.d_items
  WHERE 
    -- admissions.admittime IS NOT NULL AND
    diagnoses_icd.HADM_ID = datetimeevents.HADM_ID
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    AND datetimeevents.ITEMID = d_items.ITEMID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases