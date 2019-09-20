Create Table Employee (id int identity(1,1) primary key,
                       FirstName varchar(250),
                       MiddleName varchar(250),
                       LastName varchar(250),
                       country varchar(250),
                       faxnumber varchar(250) ,
                       salary decimal ,
                       birthdate Datetime, 
                       age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birthdate))
                        ); 
