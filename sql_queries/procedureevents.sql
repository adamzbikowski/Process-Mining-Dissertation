SELECT DISTINCT
  procedureevents_mv.HADM_ID AS patient,
  d_items.LABEL AS activity,
  string(procedureevents_mv.STARTTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.procedureevents_mv,
    physionet-data.mimiciii_clinical.diagnoses_icd,
    physionet-data.mimiciii_clinical.d_items
  WHERE
    procedureevents_mv.STARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = procedureevents_mv.HADM_ID
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    AND procedureevents_mv.ITEMID = d_items.ITEMID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases

  