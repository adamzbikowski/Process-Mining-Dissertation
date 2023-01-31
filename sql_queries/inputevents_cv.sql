SELECT DISTINCT
  inputevents_cv.HADM_ID AS patient,
  -- 'admission' AS category,
  d_items.LABEL AS activity,
  string(inputevents_cv.CHARTTIME) AS timestamp,
  diagnoses_icd.icd9_code as ICD
  FROM 
    physionet-data.mimiciii_clinical.inputevents_cv,
    physionet-data.mimiciii_clinical.diagnoses_icd,
    physionet-data.mimiciii_clinical.d_items
  WHERE
    inputevents_cv.CHARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = inputevents_cv.HADM_ID
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    AND inputevents_cv.ITEMID = d_items.ITEMID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases

  