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

UNION ALL

SELECT DISTINCT
  services.HADM_ID AS patient,
  "Transfer" AS activity,
  string(services.TRANSFERTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.services,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    services.TRANSFERTIME IS NOT NULL AND
    diagnoses_icd.HADM_ID = services.HADM_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'

UNION ALL

SELECT DISTINCT
  prescriptions.HADM_ID AS patient,
  "Drug prescribed" AS activity,
  string(prescriptions.STARTDATE) AS timestamp,
  diagnoses_icd.icd9_code as ICD
  FROM 
    physionet-data.mimiciii_clinical.prescriptions,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    prescriptions.STARTDATE IS NOT NULL AND
    diagnoses_icd.HADM_ID = prescriptions.HADM_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    -- Change the values for different diseases
