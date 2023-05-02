-- Events: Admitted, Discharged, Entered ICU, Left ICU,= '42731'

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
    AND diagnoses_icd.icd9_code = '42731'
  
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
    AND diagnoses_icd.icd9_code = '42731'

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
    AND diagnoses_icd.icd9_code = '42731'

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
    AND diagnoses_icd.icd9_code = '42731'
