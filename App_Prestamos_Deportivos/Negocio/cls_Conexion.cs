using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class cls_Conexion
    {
        public SqlConnection connection = new SqlConnection("workstation id=dbs_prestamos_deportivos.mssql.somee.com;packet size=4096;user id=dulfran1984_SQLLogin_1;pwd=od12aomn27;data source=dbs_prestamos_deportivos.mssql.somee.com;persist security info=False;initial catalog=dbs_prestamos_deportivos");
    }
}