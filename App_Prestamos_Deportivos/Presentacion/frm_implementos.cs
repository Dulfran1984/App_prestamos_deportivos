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
    public partial class frm_implementos : Form
    {
        public frm_implementos()
        {
            InitializeComponent();
        }

        private void btn_cancelar_Click(object sender, EventArgs e)
        {
            txt_cantidad.Clear();
            txt_codigo.Clear();
            txt_descripcion.Clear();
            txt_nombre.Clear();
            txt_valor.Clear();
            txt_codigo.Focus();
        }
    }
}
