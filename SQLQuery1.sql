CREATE TABLE [dbo].[T_Register] (
    [UserId]    INT      IDENTITY(1,1)     NOT NULL,
    [UserFname] NVARCHAR (50) NULL, 
    [Email]     NVARCHAR (50) NULL,
    [Pass1]     NVARCHAR (50) NULL,
    [Pass2]     NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC)
);

