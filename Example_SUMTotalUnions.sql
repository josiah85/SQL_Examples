SELECT DISTINCT One.Alpha AS A_Name
	,Nine.Kilo
	,Two.Lima
	,Four.Mike AS Sierra
	,Seven.November
	,Eight.Oscar
	,SUM(Six.Papa) AS Tango
FROM One
JOIN Two ON One.Bravo = Two.Bravo
JOIN Three ON Two.Charlie = Three.Charlie
JOIN Four ON Three.Delta = Four.Delta
JOIN Five ON Four.Delta = Five.Delta
JOIN Six ON Five.Echo = Six.Echo
JOIN Seven ON Four.Foxtrot = Seven.Foxtrot
JOIN Eight ON Four.Golf = Eight.Golf
JOIN Nine ON One.Hotel = Nine.Quebec
WHERE Six.India IN ('FF')
	AND Four.Juliet IN ('A')
	AND LOWER(Nine.Kilo) NOT LIKE '%test%'
GROUP BY One.Alpha
	,Nine.Kilo
	,Two.Lima
	,Four.Mike
	,Seven.November
	,Eight.Oscar
--------------------------------------------------------------------
--Display Grand Total

UNION

--------------------------------------------------------------------
SELECT DISTINCT A = 'zGrand_Total'
	,B = ''
	,C = ''
	,D = ''
	,E = ''
	,F = ''
	,SUM(Six.Papa) AS Tango
FROM One
JOIN Two ON One.Bravo = Two.Bravo
JOIN Three ON Two.Charlie = Three.Charlie
JOIN Four ON Three.Delta = Four.Delta
JOIN Five ON Four.Delta = Five.Delta
JOIN Six ON Five.Echo = Six.Echo
JOIN Seven ON Four.Foxtrot = Seven.Foxtrot
JOIN Eight ON Four.Golf = Eight.Golf
JOIN Nine ON One.Hotel = Nine.Quebec
WHERE Six.India IN ('FF')
	AND Four.Juliet IN ('A')
	AND LOWER(Nine.Kilo) NOT LIKE '%test%'
--------------------------------------------------------------------
--Display Individual Total

UNION

--------------------------------------------------------------------
SELECT DISTINCT A = 'Ind_Total'
	,B = ''
	,C = ''
	,D = ''
	,E = ''
	,F = ''
	,SUM(Six.Papa) AS Tango
FROM One
JOIN Two ON One.Bravo = Two.Bravo
JOIN Three ON Two.Charlie = Three.Charlie
JOIN Four ON Three.Delta = Four.Delta
JOIN Five ON Four.Delta = Five.Delta
JOIN Six ON Five.Echo = Six.Echo
JOIN Seven ON Four.Foxtrot = Seven.Foxtrot
JOIN Eight ON Four.Golf = Eight.Golf
JOIN Nine ON One.Hotel = Nine.Quebec
WHERE Six.India IN ('FF')
	AND Four.Juliet IN ('A')
	AND Nine.Kilo = 'Individual'
	AND LOWER(Nine.Kilo) NOT LIKE '%test%'
--------------------------------------------------------------------
--Display Business Total

UNION

--------------------------------------------------------------------
SELECT DISTINCT A = 'Bus_Total'
	,B = ''
	,C = ''
	,D = ''
	,E = ''
	,F = ''
	,SUM(Six.Papa) AS Tango
FROM One
JOIN Two ON One.Bravo = Two.Bravo
JOIN Three ON Two.Charlie = Three.Charlie
JOIN Four ON Three.Delta = Four.Delta
JOIN Five ON Four.Delta = Five.Delta
JOIN Six ON Five.Echo = Six.Echo
JOIN Seven ON Four.Foxtrot = Seven.Foxtrot
JOIN Eight ON Four.Golf = Eight.Golf
JOIN Nine ON One.Hotel = Nine.Quebec
WHERE Six.India IN ('FF')
	AND Four.Juliet IN ('A')
	AND Nine.Kilo = 'Business'
	AND LOWER(Nine.Kilo) NOT LIKE '%test%'
--------------------------------------------------------------------
--Display Prepaid Total

UNION

--------------------------------------------------------------------
SELECT DISTINCT A = 'PreP_Total'
	,B = ''
	,C = ''
	,D = ''
	,E = ''
	,F = ''
	,SUM(Six.Papa) AS Tango
FROM One
JOIN Two ON One.Bravo = Two.Bravo
JOIN Three ON Two.Charlie = Three.Charlie
JOIN Four ON Three.Delta = Four.Delta
JOIN Five ON Four.Delta = Five.Delta
JOIN Six ON Five.Echo = Six.Echo
JOIN Seven ON Four.Foxtrot = Seven.Foxtrot
JOIN Eight ON Four.Golf = Eight.Golf
JOIN Nine ON One.Hotel = Nine.Quebec
WHERE Six.India IN ('FF')
	AND Four.Juliet IN ('A')
	AND Nine.Kilo = 'Prepaid'
	AND LOWER(Nine.Kilo) NOT LIKE '%test%'
ORDER BY A_Name