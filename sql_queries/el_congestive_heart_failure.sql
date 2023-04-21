SELECT DISTINCT
  procedureevents_mv.HADM_ID AS patient,
  'Dialysis' AS activity,
  string(procedureevents_mv.STARTTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.procedureevents_mv,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    procedureevents_mv.STARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = procedureevents_mv.HADM_ID
    AND (procedureevents_mv.ORDERCATEGORYNAME = 'Dialysis'
    OR procedureevents_mv.ORDERCATEGORYNAME = 'Peritoneal Dialysis')
    -- diagnoses_icd.SUBJECT_ID = datetimeevents.SUBJECT_ID 
    AND diagnoses_icd.icd9_code = '4280'
    -- Change the values for different diseases

UNION ALL

SELECT DISTINCT
  procedureevents_mv.HADM_ID AS patient,
  'IV' AS activity,
  string(procedureevents_mv.STARTTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.procedureevents_mv,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    procedureevents_mv.STARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = procedureevents_mv.HADM_ID
    AND (procedureevents_mv.ORDERCATEGORYNAME = 'Invasive Lines'
    OR procedureevents_mv.ORDERCATEGORYNAME = 'Peripheral Lines')
   
    AND diagnoses_icd.icd9_code = '4280'
    -- Change the values for different diseases

UNION ALL

SELECT DISTINCT
  procedureevents_mv.HADM_ID AS patient,
  'Ventilation' AS activity,
  string(procedureevents_mv.STARTTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.procedureevents_mv,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    procedureevents_mv.STARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = procedureevents_mv.HADM_ID
    AND (procedureevents_mv.ORDERCATEGORYNAME = 'Ventilation'
    OR procedureevents_mv.ORDERCATEGORYNAME = 'Intubation/Extubation')
   
    AND diagnoses_icd.icd9_code = '4280'
    -- Change the values for different diseases

UNION ALL

SELECT DISTINCT
  procedureevents_mv.HADM_ID AS patient,
  'Imaging' AS activity,
  string(procedureevents_mv.STARTTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.procedureevents_mv,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    procedureevents_mv.STARTTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = procedureevents_mv.HADM_ID
    AND (procedureevents_mv.ORDERCATEGORYNAME = 'Imaging')
    AND diagnoses_icd.icd9_code = '4280'
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
    AND diagnoses_icd.icd9_code = '4280'
  
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
    AND diagnoses_icd.icd9_code = '4280'

UNION ALL 

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
    AND diagnoses_icd.icd9_code  = '4280'

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
    AND diagnoses_icd.icd9_code = '4280'
