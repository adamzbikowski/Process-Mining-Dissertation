SELECT DISTINCT
  microbiologyevents.HADM_ID AS patient,
  "Lab test" AS activity,
  string(microbiologyevents.CHARTTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.microbiologyevents,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    -- microbiologyevents.CHARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = microbiologyevents.HADM_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'

  