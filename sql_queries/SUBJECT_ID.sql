-- Events: Admitted, Discharged, Dead, Alive, Entered ICU, Left ICU, Lab Test, Trasnsfer

SELECT DISTINCT
  admissions.SUBJECT_ID AS patient,
  "Admitted" AS activity,
  string(admissions.ADMITTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.admissions,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE 
    -- admissions.admittime IS NOT NULL AND
    diagnoses_icd.SUBJECT_ID = admissions.SUBJECT_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
  
UNION ALL

SELECT DISTINCT
  admissions.SUBJECT_ID AS patient,
  "Discharged" AS activity,
  string(admissions.DISCHTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.admissions,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE 
    -- admissions.DISCHTIME IS NOT NULL AND
    diagnoses_icd.SUBJECT_ID = admissions.SUBJECT_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'

UNION ALL

SELECT DISTINCT
  admissions.SUBJECT_ID AS patient,
  "Dead" AS activity,
  string(admissions.DEATHTIME) AS timestamp
  FROM
    physionet-data.mimiciii_clinical.admissions,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    diagnoses_icd.SUBJECT_ID = admissions.SUBJECT_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    AND admissions.DEATHTIME IS NOT NULL

UNION ALL

SELECT DISTINCT
  admissions.SUBJECT_ID AS patient,
  "Alive" AS activity,
  "3000-01-01 00:00:00" AS timestamp
  FROM
    physionet-data.mimiciii_clinical.admissions,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    diagnoses_icd.SUBJECT_ID = admissions.SUBJECT_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
    AND admissions.DEATHTIME IS NULL

UNION ALL 

SELECT DISTINCT
  icustays.SUBJECT_ID AS patient,
  "Entered ICU" AS activity,
  string(icustays.INTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.icustays,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE 
    -- icustays.INTIME IS NOT NULL AND
    diagnoses_icd.SUBJECT_ID = icustays.SUBJECT_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'

UNION ALL

SELECT DISTINCT
  icustays.SUBJECT_ID AS patient,
  "Left ICU" AS activity,
  string(icustays.OUTTIME) AS timestamp
  FROM
    physionet-data.mimiciii_clinical.icustays,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE 
    -- icustays.INTIME IS NOT NULL AND
    diagnoses_icd.SUBJECT_ID = icustays.SUBJECT_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'

UNION ALL

SELECT DISTINCT
  microbiologyevents.SUBJECT_ID AS patient,
  "Lab test" AS activity,
  string(microbiologyevents.CHARTTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.microbiologyevents,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    -- microbiologyevents.CHARTTIME IS NOT NULL AND
    diagnoses_icd.SUBJECT_ID = microbiologyevents.SUBJECT_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'

UNION ALL

SELECT DISTINCT
  services.SUBJECT_ID AS patient,
  "Transfer" AS activity,
  string(services.TRANSFERTIME) AS timestamp
  FROM 
    physionet-data.mimiciii_clinical.services,
    physionet-data.mimiciii_clinical.diagnoses_icd
  WHERE
    services.TRANSFERTIME IS NOT NULL AND
    diagnoses_icd.SUBJECT_ID = services.SUBJECT_ID
    AND diagnoses_icd.icd9_code BETWEEN '390%' AND '460%'
  

