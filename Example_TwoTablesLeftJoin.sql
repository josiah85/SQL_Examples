DECLARE @StartDate VARCHAR(40)
	,@StopDate VARCHAR(40)

SELECT @StartDate = dateadd(month, - 6, dateadd(day, 0, datediff(day, 0, getdate())))
	,@StopDate = DATEADD(dd, DATEDIFF(dd, 0, getdate()), 0)

SELECT T1.Papa
	,T1.Oscar
	,T1.Tango
	,T2.Uniform
	,ISNULL(T3.Quebec, '') AS Sierra
FROM (
	SELECT a.Alpha
		,a.Bravo AS Papa
		,e.Charlie AS Oscar
		,COUNT(g.Juliet) AS Tango
	FROM One a
	JOIN Two c ON a.Alpha = c.Alpha
	JOIN Three d ON c.Delta = d.Delta
	JOIN Four e ON d.Echo = e.Echo
	JOIN Five f ON e.Foxtrot = f.Foxtrot
	JOIN Six g ON f.Golf = g.Golf
	JOIN Seven a1 ON f.Hotel = a1.Hotel
	WHERE (
			f.India >= @StartDate
			AND f.India <= @StopDate
			)
		AND g.Juliet = 'On'
		AND a1.Kilo = 'Busy'
	GROUP BY a.Alpha
		,a.Bravo
		,e.Charlie
	) AS T1
LEFT JOIN (
	SELECT a.Alpha
		,a.Bravo AS Papa
		,e.Charlie AS Oscar
		,a2.Lima AS Uniform
	FROM One a
	JOIN Two c ON a.Alpha = c.Alpha
	JOIN Three d ON c.Delta = d.Delta
	JOIN Four e ON d.Echo = e.Echo
	JOIN Five f ON e.Foxtrot = f.Foxtrot
		AND f.India = (
			SELECT MAX(A.India)
			FROM Five A
			JOIN Four B ON A.Foxtrot = B.Foxtrot
			WHERE B.Charlie = e.Charlie
				AND A.Alpha = a.Alpha
			)
		AND f.Mike = (
			SELECT MAX(A.Mike)
			FROM Five A
			JOIN Four B ON A.Foxtrot = B.Foxtrot
			WHERE B.Charlie = e.Charlie
				AND A.Alpha = a.Alpha
				AND A.India = f.India
			)
	JOIN Eight a2 ON c.November = a2.November
	) AS T2 ON T1.Alpha = T2.Alpha
	AND T1.Oscar = T2.Oscar
LEFT JOIN (
	SELECT a.Alpha
		,a.Bravo AS Papa
		,e.Charlie AS Oscar
		,a4.Quebec
	FROM One a
	JOIN Two c ON a.Alpha = c.Alpha
	JOIN Three d ON c.Delta = d.Delta
	JOIN Four e ON d.Echo = e.Echo
	JOIN Five f ON e.Foxtrot = f.Foxtrot
		AND f.India = (
			SELECT MAX(A.India)
			FROM Five A
			JOIN Four B ON A.Foxtrot = B.Foxtrot
			WHERE B.Charlie = e.Charlie
				AND A.Alpha = a.Alpha
			)
		AND f.Mike = (
			SELECT MAX(A.Mike)
			FROM Five A
			JOIN Four B ON A.Foxtrot = B.Foxtrot
			WHERE B.Charlie = e.Charlie
				AND A.Alpha = a.Alpha
				AND A.India = f.India
			)
	JOIN Nine a3 ON f.Foxtrot = a3.Foxtrot
	JOIN Ten a4 ON a3.Romeo = a4.Romeo
	WHERE a4.Quebec IN (
			'XX'
			,'YY'
			)
	) AS T3 ON T1.Alpha = T3.Alpha
	AND T1.Oscar = T3.Oscar
ORDER BY T1.Papa
	,T1.Oscar