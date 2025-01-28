create procedure DeleteUserAccount
     @userEmail varchar(50)
as

begin
     delete from UserDetails where userEmail = @userEmail;
end;