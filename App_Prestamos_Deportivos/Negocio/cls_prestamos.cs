using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class cls_prestamos
    {
        cls_Conexion objconect = new cls_Conexion();
        private string str_nombre;
        public void fnt_consultar(string codigo)
        {
            SqlCommand con; SqlDataReader Lectura;
            con = new SqlCommand("SP_consultarpersona", objconect.connection);
            con.CommandType = CommandType.StoredProcedure;
            con.Parameters.AddWithValue("@id", codigo);
            objconect.connection.Open();
            Lectura = con.ExecuteReader();
            if (Lectura.Read() == true)
            {
                str_nombre = Convert.ToString(Lectura[0]);
            }
            objconect.connection.Close();
        }
        public string getNombre() { return this.str_nombre; }
    }
}