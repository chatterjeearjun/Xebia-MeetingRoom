USE [Meeting_Room]
GO
/****** Object:  StoredProcedure [dbo].[Book_MeetingRoom]    Script Date: 23-07-2018 17:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_Details]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select [RoomID],[RoomName] From [Meeting_Room].[dbo].[Room] Where [isUnderMaintenance]= 0;
	Select [FeatureID],[FeatureName] From [Meeting_Room].[dbo].[Features] Where [isCurrentlyAvailble]=1;


	Select R.[RoomID],R.[RoomName],F.[FeatureID],F.[FeatureName] FROM [Meeting_Room].[dbo].[Room] R
	LEFT JOIN [Meeting_Room].[dbo].[MappingRoomFeatures] M ON R.[RoomID]=M.[RoomID]
	INNER JOIN [Meeting_Room].[dbo].[Features] F ON M.[FeatureID]=F.[FeatureID]
	Where R.[isUnderMaintenance]= 0 And F.[isCurrentlyAvailble]=1 Order By R.[RoomID];

END
