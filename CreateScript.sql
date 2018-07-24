CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    RoomName VARCHAR(255),
	RoomCost INT,
    isUnderMaintenance BIT
);

CREATE TABLE Features (
	FeatureID INT PRIMARY KEY,
    FeatureName VARCHAR(255),
    isCurrentlyAvailble BIT
);

CREATE TABLE MappingRoomFeatures (
	FeatureID INT FOREIGN KEY REFERENCES Features(FeatureID),
    RoomID INT FOREIGN KEY REFERENCES Room(RoomID)
);

CREATE TABLE RoomsAvailability (
	RecordID INT NOT NULL IDENTITY (1, 1),
    RoomID INT FOREIGN KEY REFERENCES Room(RoomID),
    EmployeeName VARCHAR(255),
	FromDateTime DATETIME,
	ToDateTime DATETIME
);
