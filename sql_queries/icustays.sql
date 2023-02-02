SELECT DISTINCT
  icustays.HADM_ID AS patient,
  "Entered ICU" AS activity,
  string(icustays.INTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.icustays,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE 
    -- icustays.INTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = icustays.HADM_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'

  UNION ALL

  SELECT DISTINCT
    icustays.HADM_ID AS patient,
    "Left ICU" AS activity,
    string(icustays.OUTTIME) AS timestamp
    FROM
      physionet-data.mimiciii_clinical.icustays,
      physionet-data.mimiciii_clinical.diagnoses_icd
    WHERE 
      -- icustays.INTIME IS NOT NULL AND
      diagnoses_icd.HADM_ID = icustays.HADM_ID
      AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'