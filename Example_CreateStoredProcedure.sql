USE [GenericDatabase]
GO

/****** Object:  StoredProcedure [dbo].[spExampleScript]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spExampleScript] @PassedID VARCHAR(16) = NULL
	,@StartDate VARCHAR(40) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT DISTINCT
		a.Sierra AS New_Name
		,h.Tango
		,c.Uniform
		,e.Mike
		,e.Victor
		,e.Whiskey
		,g.Xray
		,f.Yankee
		,i.Yankee
		,i.Xray
		,f.Zulu
		,j.India
	FROM One a
	JOIN Two c ON a.Juliet = c.Juliet
	JOIN Three d ON c.Kilo = d.Kilo
	JOIN Four e ON d.Lima = e.Lima
	JOIN Five f ON e.Mike = f.Mike
	JOIN Six g ON f.November = g.November
	JOIN Seven h ON a.Oscar = h.Romeo
	JOIN Eight i ON e.Papa = i.Papa
	JOIN Nine j ON e.Quebec = j.Quebec
	WHERE (
			e.Victor = @PassedID
			OR @PassedID IS NULL
			)
		AND f.Yankee >= @StartDate
	ORDER BY
		Yankee
END
GO

