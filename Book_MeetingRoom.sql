SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE Book_MeetingRoom 
	@bookingId int output,
    @roomID INT,
    @employeeName varchar(255),
    @fromDateTime DateTime,
    @toDateTime DateTime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT @bookingId = ISNULL(MAX([RecordID])+1,1) FROM [RoomsAvailability];
    insert into RoomsAvailability([RecordID], [RoomID], [EmployeeName], [FromDateTime], [ToDateTime])
    values(@bookingId, @roomID, @employeeName, @fromDateTime, @toDateTime);

END
GO
