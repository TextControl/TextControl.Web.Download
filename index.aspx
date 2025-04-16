<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="tx_download_ribbon.index" %>

<%@ Register Assembly="TXTextControl.Web, Version=33.0.1300.500, Culture=neutral, PublicKeyToken=6b83fe9a75cfb638" Namespace="TXTextControl.Web" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TX Text Control: Download document as PDF</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <cc1:TextControl ID="TextControl1" runat="server" Dock="Window" />

        <asp:Button style="display: none;" ID="dummyButton" runat="server" Text="" OnClick="dummyButton_Click" /> 

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers> 
                <asp:AsyncPostBackTrigger ControlID="dummyButton" EventName="Click" /> 
            </Triggers> 
        </asp:UpdatePanel>

        <script>
            TXTextControl.addEventListener("ribbonTabsLoaded", function (e) {
                addAction();
            });

            function addAction() {
                sSaveBtn = '<li role="presentation" class="ui-menu-item" id="fileMnuItemDownload"><a role="menuitem" tabindex="-1" class="ui-corner-all" id="ui-id-1" href="#!"><div class="large-menu-item-image-container"><img src="icons/download.png"></div><div class="large-menu-item-caption-container"><p>Download</p></div></a></li>'; 
 
                // add the new button and ribbon group using HTML 
                document.getElementById('fileMnuItemSaveAs').insertAdjacentHTML(
                    'beforebegin', sSaveBtn);

                // force a post back on the invisible button 
                document.getElementById("fileMnuItemDownload").addEventListener(
                    "click",
                    function () {
                        __doPostBack('<%= dummyButton.ClientID %>', '');
                    });
            }
        </script>

    </div>
    </form>
</body>
</html>
