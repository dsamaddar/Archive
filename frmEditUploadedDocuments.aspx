<%@ Page Language="VB" MasterPageFile="~/FileStorage.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmEditUploadedDocuments.aspx.vb" Inherits="frmEditUploadedDocuments"
    Title=".:FileStorage:Edit Uploaded Files:." %>

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
            </td>
        </tr>
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
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 100px; max-width: 100%;
                                    overflow: auto">
                                    <asp:GridView ID="grdUploadedDocuments" runat="server" CssClass="mGrid" AutoGenerateColumns="False"
                                        EmptyDataText="No File Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FileStorageID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFileStorageID" runat="server" Text='<%# Bind("FileStorageID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                            <asp:BoundField DataField="CabinetLocation" HeaderText="CabinetLocation" />
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
                <asp:Panel ID="pnlUploadFile" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4">
                                <div class="widget-title">
                                    Upload Documents</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldAgreementID" runat="server" />
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldOriginalFileName" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label" width="150px">
                                Reference No
                            </td>
                            <td style="width: 250px">
                                <asp:TextBox ID="txtReferenceNo" runat="server" CssClass="InputTxtBox" 
                                    Width="250px" ValidationGroup="upDoc"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldRefNo" runat="server" 
                                    ControlToValidate="txtReferenceNo" CssClass="RequiredLabel" ErrorMessage="*" 
                                    ValidationGroup="upDoc"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label" width="150px">
                                File Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtFileName" runat="server" CssClass="InputTxtBox" 
                                    Width="250px" ValidationGroup="upDoc"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldFileName" runat="server" 
                                    ControlToValidate="txtFileName" CssClass="RequiredLabel" ErrorMessage="*" 
                                    ValidationGroup="upDoc"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Category
                            </td>
                            <td>
                                <asp:DropDownList ID="drpFileCategory" runat="server" CssClass="InputTxtBox" 
                                    Width="250px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Custodian
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCustodianDept" runat="server" CssClass="InputTxtBox" 
                                    Width="250px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Responsible
                            </td>
                            <td>
                                <asp:DropDownList ID="drpResponsiblePerson" runat="server" CssClass="InputTxtBox"
                                    Width="250px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td class="label">
                                Location
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCabinetLocation" runat="server" CssClass="InputTxtBox" 
                                    Width="250px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="250px" ValidationGroup="upDoc"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" 
                                    ControlToValidate="txtRemarks" CssClass="RequiredLabel" ErrorMessage="*" 
                                    ValidationGroup="upDoc"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td class="label">
                                Effective Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="InputTxtBox" 
                                    ValidationGroup="upDoc"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEffectiveDate_CalendarExtender0" runat="server" Enabled="True"
                                    TargetControlID="txtEffectiveDate" Format="dd-MMM-yyyy">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldEffectiveDate" runat="server" 
                                    ControlToValidate="txtEffectiveDate" CssClass="RequiredLabel" ErrorMessage="*" 
                                    ValidationGroup="upDoc"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Attachment
                            </td>
                            <td>
                                <asp:FileUpload ID="flUpDoc" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:HyperLink ID="hpLnkUploadedFile" Target="_blank" runat="server">Uploaded File</asp:HyperLink>
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldAttachmentID" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:Button ID="btnUpdateDocument" runat="server" CssClass="styled-button-1" 
                                    Text="Update Document" ValidationGroup="upDoc" />
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
</asp:Content>
