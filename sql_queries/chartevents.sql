SELECT DISTINCT
  chartevents.HADM_ID AS patient,
  -- 'admission' AS category,
  d_items.LABEL AS activity,
  string(chartevents.CHARTTIME) AS timestamp,
  diagnoses_icd.icd9_code as ICD
  FROM 
    physionet-data.mimiciii_clinical.chartevents,
    physionet-data.mimiciii_clinical.diagnoses_icd,
    physionet-data.mimiciii_clinical.d_items
  WHERE 
    -- admissions.admittime IS NOT NULL AND
    diagnoses_icd.HADM_ID = chartevents.HADM_ID
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    AND chartevents.ITEMID = d_items.ITEMID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases