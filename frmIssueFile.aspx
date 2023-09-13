<%@ Page Language="VB" MasterPageFile="~/FileStorage.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmIssueFile.aspx.vb" Inherits="frmIssueFile" Title=".:Archive:Issue File:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
                                    Issue Files</div>
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
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 150px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdUploadedDocuments" runat="server" CssClass="mGrid" AutoGenerateColumns="False"
                                        EmptyDataText="No File Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBtnSelectFile" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FileStorageID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFileStorageID" runat="server" Text='<%# Bind("FileStorageID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="AgreementNo" HeaderText="AgreementNo" />
                                            <asp:TemplateField HeaderText="ReferenceNo" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReferenceNo" runat="server" Text='<%# Bind("ReferenceNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="FileName" HeaderText="File" />
                                            <asp:TemplateField HeaderText="Attachment">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%# ConfigurationManager.AppSettings("OutputStorageFiles")+ Eval("Attachment") %>'
                                                        Target="_blank">View</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Custodian" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustodian" runat="server" Text='<%# Bind("Custodian") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Responsible" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsible" runat="server" Text='<%# Bind("Responsible") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="CabinetLocation" HeaderText="CabinetLocation" />
                                            <asp:TemplateField HeaderText="IsIssued" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIsIssued" runat="server" Text='<%# Bind("IsIssued") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LastIssuedBy" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLastIssuedBy" runat="server" Text='<%# Bind("LastIssuedBy") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LastIssuedOn" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLastIssuedOn" runat="server" Text='<%# Bind("LastIssuedOn") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
        <tr>
            <td>
                <asp:Panel ID="pnlIssueFile" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="5">
                                <div class="widget-title">
                                    &nbsp;Issue File</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldFileStorageID" runat="server" />
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Reference No
                            </td>
                            <td>
                                <asp:Label ID="lReferenceNo" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Custodian
                            </td>
                            <td>
                                <asp:Label ID="lCustodian" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Responsible Person
                            </td>
                            <td>
                                <asp:Label ID="lResponsiblePerson" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                File Issue Status
                            </td>
                            <td>
                                <asp:Label ID="lFileIssueStatus" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <hr></hr>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Issue To
                            </td>
                            <td>
                                <asp:DropDownList ID="drpIssueTo" runat="server" CssClass="InputTxtBox" Width="250px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Issue Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtIssueOn" type="date" runat="server" CssClass="InputTxtBox" Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldIssueOn" runat="server" ControlToValidate="txtIssueOn"
                                    Display="None" ErrorMessage="Required : Issue Date" ValidationGroup="IssueFile"></asp:RequiredFieldValidator>
                            </td>
                            <td class="label">
                                File Permission
                            </td>
                            <td>
                                <asp:CheckBoxList ID="chkbxFilePermission" runat="server" CssClass="chkText">
                                    <asp:ListItem Value="Online">Online Copy</asp:ListItem>
                                    <asp:ListItem Value="Offline">Offline Copy</asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Return Deadline
                            </td>
                            <td>
                                <asp:TextBox ID="txtReturnDeadLine" runat="server" Width="250px" CssClass="InputTxtBox"
                                    type="date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldReturnDeadLine" runat="server" ControlToValidate="txtReturnDeadLine"
                                    Display="None" ErrorMessage="Required : Return Deadline" ValidationGroup="IssueFile"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:CustomValidator ID="cusValchkbxFilePermission" ErrorMessage="Please select Online/Offline or both."
                                    ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server"
                                    ValidationGroup="IssueFile" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtIssueRemarks" runat="server" CssClass="InputTxtBox" TextMode="MultiLine"
                                    Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldIssueRemarks" runat="server" ControlToValidate="txtIssueRemarks"
                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="IssueFile"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldIssueRemarks_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/img/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldIssueRemarks" WarningIconImageUrl="~/Sources/img/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnProcess" runat="server" CssClass="styled-button-1" Text="Process Issue File"
                                    ValidationGroup="IssueFile" />
                            </td>
                            <td>
                            </td>
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

    <script type="text/javascript">
    function ValidateCheckBoxList(sender, args) {
        var checkBoxList = document.getElementById("<%=chkbxFilePermission.ClientID %>");
        var checkboxes = checkBoxList.getElementsByTagName("input");
        var isValid = false;
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                isValid = true;
                break;
            }
        }
        args.IsValid = isValid;
    }
    </script>

</asp:Content>
