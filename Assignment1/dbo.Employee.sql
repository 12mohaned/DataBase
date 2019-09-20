CREATE TABLE [dbo].[Employee] (
    [id]         INT          NULL,
    [FirstName]  VARCHAR (250)  NULL,
    [MiddleName] VARCHAR (250)  NULL,
    [Lastname]   VARCHAR (250)  NULL,
    [country]    VARCHAR (250)  NULL,
    [faxNumber]  INT          NULL,
    [salary]     DECIMAL (18) NULL,
    [birth_date] DATE         NULL,
    [age]        INT          NULL,
    UNIQUE NONCLUSTERED ([id] ASC)
);

