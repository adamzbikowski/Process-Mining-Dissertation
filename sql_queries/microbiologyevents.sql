SELECT DISTINCT
  microbiologyevents.HADM_ID AS patient,
  -- 'admission' AS category,
  microbiologyevents.SPEC_TYPE_DESC AS activity,
  string(microbiologyevents.CHARTTIME) AS timestamp,
  diagnoses_icd.icd9_code as ICD
  FROM 
    physionet-data.mimiciii_clinical.microbiologyevents,
    physionet-data.mimiciii_clinical.diagnoses_icd
    -- physionet-data.mimiciii_clinical.d_items
  WHERE
    microbiologyevents.CHARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = microbiologyevents.HADM_ID
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    -- AND microbiologyevents.ITEMID = d_items.ITEMID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases

  