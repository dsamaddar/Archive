<%@ Page Language="VB" MasterPageFile="~/FileStorage.master" AutoEventWireup="false"
    CodeFile="frmAccessFile.aspx.vb" Inherits="frmAccessFile" Theme="CommonSkin"
    Title=".:Archive: Access File:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="Server">

    <script type="text/javascript">
        window.onload = function() {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("divgrd").scrollTop = strPos;
            }
        }
        function SetDivPosition() {
            var intY = document.getElementById("divgrd").scrollTop;
            document.title = intY;
            document.cookie = "yPos=!~" + intY + "~!";
        }

        window.scrollBy(100, 100); 
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <div class="widget-title">
                    My Assigned Files
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlMyAssignedFiles" runat="server" SkinID="pnlInner">
                    <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 300px; max-width: 100%;
                        overflow: auto">
                        <asp:GridView ID="grdMyAssignedFiles" runat="server" AutoGenerateColumns="False"
                            CssClass="mGrid" EmptyDataText="No File Found">
                            <Columns>
                                <asp:BoundField DataField="FileStorageID" HeaderText="FileStorageID" Visible="False" />
                                <asp:BoundField DataField="AgreementNo" HeaderText="AgreementNo" />
                                <asp:BoundField DataField="ReferenceNo" HeaderText="ReferenceNo" />
                                <asp:BoundField DataField="FileName" HeaderText="File" />
                                <asp:TemplateField HeaderText="Attachment">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%# ConfigurationManager.AppSettings("OutputStorageFiles")+ Eval("Attachment") %>'
                                            Target="_blank">View</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Custodian" HeaderText="Custodian" />
                                <asp:BoundField DataField="Responsible" HeaderText="Responsible" />
                                <asp:BoundField DataField="OnlineCopy" HeaderText="Online" />
                                <asp:BoundField DataField="OfflineCopy" HeaderText="Offline" />
                                <asp:BoundField DataField="ReturnDeadLine" HeaderText="DeadLine" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
