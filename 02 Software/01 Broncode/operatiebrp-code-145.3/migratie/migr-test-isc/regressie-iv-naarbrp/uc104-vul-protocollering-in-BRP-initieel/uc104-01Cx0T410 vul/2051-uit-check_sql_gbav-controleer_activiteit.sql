SELECT COUNT(*) AS aantal_activiteit
FROM public.activiteit 
WHERE activiteit_type='101'
AND activiteit_subtype='1226'
AND toestand='7999'
AND communicatie_partner='510221';