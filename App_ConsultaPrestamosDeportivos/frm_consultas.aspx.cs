using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_ConsultaPrestamosDeportivos
{
    public partial class frm_consultas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_consultar_Click(object sender, EventArgs e)
        {
            cls_consultar obj_Consulta = new cls_consultar();
            obj_Consulta.fnt_consultar(txt_id.Text);
            dtg_prestamos.DataSource = obj_Consulta.getDt_prestamos();
            dtg_prestamos.DataBind();
            if(dtg_prestamos.Rows.Count <= 0)
            {
                lbl_mensaje.Text = "No se encontraron registros";
                lbl_mensaje.CssClass = "alert alert-danger role=alert";
                lbl_mensaje.Visible = true;
                dtg_prestamos.Visible = false;
            }
            else
            {
                lbl_mensaje.Text = "";
                lbl_mensaje.Visible = false;
                dtg_prestamos.Visible = true;
            }
        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            txt_id.Text = "";
            lbl_mensaje.Text = "";
            lbl_mensaje.Visible = false;
            dtg_prestamos.Visible = false;
            txt_id.Focus();
        }
    }
}