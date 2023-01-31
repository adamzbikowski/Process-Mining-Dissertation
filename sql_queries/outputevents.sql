SELECT DISTINCT
  outputevents.HADM_ID AS patient,
  d_items.LABEL AS activity,
  string(outputevents.CHARTTIME) AS timestamp,
  diagnoses_icd.icd9_code as ICD
  FROM 
    physionet-data.mimiciii_clinical.outputevents,
    physionet-data.mimiciii_clinical.diagnoses_icd,
    physionet-data.mimiciii_clinical.d_items
  WHERE
    outputevents.CHARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = outputevents.HADM_ID
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    AND outputevents.ITEMID = d_items.ITEMID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases

  