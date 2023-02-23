SELECT DISTINCT
  procedureevents_mv.HADM_ID AS patient,
  procedureevents_mv.ORDERCATEGORYNAME AS activity,
  string(procedureevents_mv.STARTTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.procedureevents_mv,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    procedureevents_mv.STARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = procedureevents_mv.HADM_ID
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases

UNION ALL

SELECT DISTINCT
  admissions.HADM_ID AS patient,
  "Admitted" AS activity,
  string(admissions.ADMITTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.admissions,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE 
    -- admissions.admittime IS NOT NULL AND
    diagnoses_icd.HADM_ID = admissions.HADM_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
  
UNION ALL

SELECT DISTINCT
  admissions.HADM_ID AS patient,
  "Discharged" AS activity,
  string(admissions.DISCHTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.admissions,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE 
    -- admissions.DISCHTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = admissions.HADM_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
