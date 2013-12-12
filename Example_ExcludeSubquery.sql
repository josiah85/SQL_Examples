SELECT DISTINCT h.EchoNo AS New_Name
	,b.Foxtrot
	,Five.Golf
FROM One a
JOIN Two b ON a.AlphaKey = b.AlphaKey
JOIN Three g ON a.BravoKey = g.BravoKey
JOIN Four h ON g.CharlieKey = h.CharlieKey
JOIN Five ON h.DeltaKey = Five.DeltaKey
WHERE h.EchoNo NOT IN (
		SELECT DISTINCT h.EchoNo AS New_Name
		FROM One a
		JOIN Two b ON a.AlphaKey = b.AlphaKey
		JOIN Three g ON a.BravoKey = g.BravoKey
		JOIN Four h ON g.CharlieKey = h.CharlieKey
		WHERE b.Foxtrot IN ('A')
		)
	AND Five.Golf IN ('Active')
ORDER BY EchoNo