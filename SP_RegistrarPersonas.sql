use dbs_prestamos_deportivos
go
-- =============================================
-- Author:		<Author,Dulfran Montaño>
-- Create date: <Create Date, 12 de octubre del 2023>
-- Description:	<Description, Registrar personas>
-- =============================================
create procedure SP_RegistrarPersonas
@id varchar(10),@p_nombre varchar(40),@s_nombre varchar(40),@p_apellido varchar(40),
@s_apellido varchar(40),@contacto varchar(10),@correo varchar(80),
@direccion varchar(100),@sexo char
as begin
	insert into tbl_personas
	(PKId,P_nombre,S_nombre,P_apellido,S_apellido,Contacto,Correo,Direccion,FKId_tbl_sexo)
	values
	(@id,@p_nombre,@s_nombre,@p_apellido,@s_apellido,@contacto,@correo,@direccion,@sexo)
end