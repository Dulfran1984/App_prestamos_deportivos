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
        private string str_nombre_implemento;
        private string str_especificiaciones;
        private int int_cantidad;
        private double flt_valor;
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
        public void fnt_consultar_implemento(string codigo)
        {
            SqlCommand con; SqlDataReader Lectura;
            con = new SqlCommand("SP_ConsultarImplemento", objconect.connection);
            con.CommandType = CommandType.StoredProcedure;
            con.Parameters.AddWithValue("@codigo", codigo);
            objconect.connection.Open();
            Lectura = con.ExecuteReader();
            if (Lectura.Read() == true)
            {
                str_nombre_implemento = Convert.ToString(Lectura[0]);
                str_especificiaciones = Convert.ToString(Lectura[1]);
                int_cantidad = Convert.ToInt16(Lectura[2]);
                flt_valor = Convert.ToDouble(Lectura[3]);
            }
            objconect.connection.Close();
        }
        public string getNombre() { return this.str_nombre; }
        public string get_NombreImplemento() { return this.str_nombre_implemento; }
        public string get_Especificaciones() { return this.str_especificiaciones; }
        public int getCantidad() { return this.int_cantidad; }
        public double getValor() { return this.flt_valor; }
    }
}