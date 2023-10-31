using Negocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Presentacion
{
    public partial class frm_prestamos : Form
    {
        public frm_prestamos()
        {
            InitializeComponent();
        }

        private void btn_cancelar_Click(object sender, EventArgs e)
        {
            txt_cantidad_prestamo.Clear();
            txt_codigo.Clear();
            txt_descripcion.Clear();
            txt_existencias.Clear();
            txt_id.Clear();
            txt_nombre.Clear();
            txt_nombre_implemento.Clear();
            txt_observaciones.Clear();
            dtg_prestamo.DataSource = null;
            txt_id.Focus();
        }

        private void txt_id_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                cls_prestamos objConsultarP = new cls_prestamos();
                objConsultarP.fnt_consultar(txt_id.Text);
                txt_nombre.Text = objConsultarP.getNombre();
            }
        }
    }
}