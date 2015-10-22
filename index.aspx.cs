using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tx_download_ribbon
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // execute only when loaded from IFRAME
            if (Request.QueryString["download"] == "1")
            {
                if (Session["document"] == null)
                    return;

                // return the stored document
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=results.pdf");
                Response.BinaryWrite((byte[])Session["document"]);
            }
        }

        protected void dummyButton_Click(object sender, EventArgs e)
        {
            // save the document as PDF in a session variable
            byte[] data;
            TextControl1.SaveText(out data,
                TXTextControl.Web.BinaryStreamType.AdobePDF);

            Session["document"] = data;

            // create a new IFRAME and call this ASPX with QueryString
            // to load document from session data
            ScriptManager.RegisterClientScriptBlock(
                this.Page,
                this.Page.GetType(),
                "alert",
                "var iframe = document.createElement('iframe');iframe.src = 'index.aspx?download=1';iframe.style.display = 'none';document.body.appendChild(iframe);",
                true); 
        }
    }
}