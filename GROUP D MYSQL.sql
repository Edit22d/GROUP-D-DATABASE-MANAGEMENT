CREATE DATABASE WasteManagement;

USE WasteManagement;

CREATE TABLE Residents (
  ResidentID INT AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  ContactInformation VARCHAR(255) NOT NULL,
  PRIMARY KEY (ResidentID)
);

CREATE TABLE Waste (
  WasteID INT AUTO_INCREMENT,
  Type VARCHAR(255) NOT NULL,
  Quantity DECIMAL(10, 2) NOT NULL,
  GenerationDate DATE NOT NULL,
  ResidentID INT NOT NULL,
  PRIMARY KEY (WasteID),
  FOREIGN KEY (ResidentID) REFERENCES Residents(ResidentID)
);

CREATE TABLE WasteManagementFacilities (
  FacilityID INT AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Location VARCHAR(255) NOT NULL,
  Capacity DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (FacilityID)
);

CREATE TABLE WasteCollectionServices (
  ServiceID INT AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Frequency VARCHAR(255) NOT NULL,
  CoverageArea VARCHAR(255) NOT NULL,
  FacilityID INT NOT NULL,
  PRIMARY KEY (ServiceID),
  FOREIGN KEY (FacilityID) REFERENCES WasteManagementFacilities(FacilityID)
);

CREATE TABLE WasteDisposalMethods (
  MethodID INT AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  PRIMARY KEY (MethodID)
);

CREATE TABLE CommunityParticipation (
  ParticipationID INT AUTO_INCREMENT,
  ResidentID INT NOT NULL,
  ParticipationType VARCHAR(255) NOT NULL,
  PRIMARY KEY (ParticipationID),
  FOREIGN KEY (ResidentID) REFERENCES Residents(ResidentID)
);

CREATE TABLE PolicyInterventions (
  PolicyID INT AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  ImplementationDate DATE NOT NULL,
  FacilityID INT NOT NULL,
  PRIMARY KEY (PolicyID),
  FOREIGN KEY (FacilityID) REFERENCES WasteManagementFacilities(FacilityID)
);
