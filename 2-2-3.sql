-- caching KDIGO period
-- aki_stage 
select distinct a.subject_id
-- connect section 1
FROM `physionet-data.mimiciv_hosp.admissions` as a 
inner join `physionet-data.mimiciv_derived.kdigo_stages` as k
on k.subject_id = a.subject_id
-- 路徑: physionet-data.mimiciv_hosp.admissions -> 欄位: hospital_expire_flag (die in hospital)
inner join `physionet-data.mimiciv_derived.icustay_detail` as i
on i.subject_id = a.subject_id

where a.hospital_expire_flag = 1 and (datetime_diff(a.dischtime, i.icu_outtime, hour) < 1)
