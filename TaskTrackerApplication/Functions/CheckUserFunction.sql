create function dbo.IsUserPresent(@UserEmail varchar(50))
returns bit
as
begin
 declare @IsPresent bit;

 if exists (select 1 from UserDetails where userEmail = @UserEmail)
 begin 
    set @IsPresent = 1;
 end
 else
 begin
    set @IsPresent = 0;
 end

 return @IsPresent;
end;