<%@ Page Language="VB" MasterPageFile="~/FileStorage.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmSearchFiles.aspx.vb" Inherits="frmSearchFiles"
    Title=".:Archive : Search Files:." MaintainScrollPositionOnPostback="true" %>

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
                <asp:Panel ID="pnlSearchBox" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="3">
                                <div class="widget-title">
                                    Search Files</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSearchBox" placeholder="Search by Agreement No/Client/Client Id"
                                    runat="server" CssClass="InputTxtBox" Width="300px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSearchFile" runat="server" Text="Search File" CssClass="styled-button-1" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlUploadedDocuments" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    &nbsp;Search Result</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 200px; max-width: 100%;
                                    overflow: auto">
                                    <asp:GridView ID="grdUploadedDocuments" runat="server" CssClass="mGrid" AutoGenerateColumns="False"
                                        EmptyDataText="No File Found">
                                        <Columns>
                                            <asp:BoundField DataField="FileStorageID" HeaderText="FileStorageID" Visible="False" />
                                            <asp:BoundField DataField="AgreementNo" HeaderText="Agr.No" />
                                            <asp:BoundField DataField="ReferenceNo" HeaderText="Ref.No" />
                                            <asp:BoundField DataField="FileName" HeaderText="File" />
                                            <asp:BoundField DataField="ClientName" HeaderText="Client" />
                                            <asp:TemplateField HeaderText="Attachment">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%# ConfigurationManager.AppSettings("OutputStorageFilesx")+ Eval("Attachment") %>'
                                                        Target="_blank">View</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Custodian" HeaderText="Custodian" />
                                            <asp:BoundField DataField="CabinetLocation" HeaderText="CabinetLocation" />
                                            <asp:BoundField DataField="EntryDate" HeaderText="UploadedOn" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
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
