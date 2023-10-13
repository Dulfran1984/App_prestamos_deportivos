use dbs_prestamos_deportivos
go
-- =============================================
-- Author:		<Author,Dulfran Montaño>
-- Create date: <Create Date, 12 de octubre del 2023>
-- Description:	<Description,Registro Usuario>
-- =============================================
CREATE TRIGGER TRG_RegistrarUsuario 
   ON  tbl_personas 
   AFTER INSERT
AS 
BEGIN
	declare @id varchar(10)
	declare @p_nombre varchar(40)
	declare @p_apellido varchar(40)
	declare @user varchar(100)

	SET NOCOUNT ON;
	select @id = (select PKId from inserted)
	select @p_nombre = (select P_nombre from inserted)
	select @p_apellido = (select P_apellido from inserted)
    select @user = @id + '.' + @p_nombre + @p_apellido
	insert into tbl_usuarios
	(PKUsuario,Contraseña,FKId_tbl_personas,Fecha,FKCodigo_tbl_estado,FKCodigo_tbl_rol)
	values
	(@user,@id,@id,GETDATE(),1,4)

END
GO