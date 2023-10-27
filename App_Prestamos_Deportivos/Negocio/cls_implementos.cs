using System;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;
using System.Windows.Forms;

namespace Negocio
{
    public class cls_implementos
    {
        private String str_codigo;
        private String str_nombre;
        private String str_descripcion;
        private float flt_precio;
        private int int_cantidad;
        cls_Conexion objconect = new cls_Conexion();

        public void fnt_registrar(string codigo, string nombre,string descripcion,double precio,int cantidad)
        {
            SqlCommand con = new SqlCommand("SP_AgregarImplemento", objconect.connection);
            con.CommandType = CommandType.StoredProcedure;
            con.Parameters.AddWithValue("@codigo", codigo);
            con.Parameters.AddWithValue("@nombre", nombre);
            con.Parameters.AddWithValue("@especificaciones", descripcion);
            con.Parameters.AddWithValue("@cantidad", cantidad);
            con.Parameters.AddWithValue("@valor", precio);
            objconect.connection.Open();
            con.ExecuteNonQuery();
            objconect.connection.Close();
            MessageBox.Show("Implemento registrado con éxito", "Registrar", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}