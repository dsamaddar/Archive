<%@ Page Language="VB" MasterPageFile="~/FileStorage.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmManageAgreements.aspx.vb" Inherits="frmManageAgreements"
    Title=".:Archive:Manage Agreements:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlManageAgreements" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4">
                                <div class="widget-title">
                                    Manage Agreements<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                                <asp:HiddenField ID="hdfldAgreementID" runat="server" />
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtClientName" runat="server" CssClass="InputTxtBox" Placeholder="Client Name"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtClientId" runat="server" CssClass="InputTxtBox" Placeholder="Client Id"
                                    Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAgreementNo" runat="server" CssClass="InputTxtBox" Placeholder="Agreement No"
                                    Width="100px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldClientName" runat="server" ControlToValidate="txtClientName"
                                    Display="None" ErrorMessage="Required: Client Name" ValidationGroup="Agreement"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldClientName_valcalout" runat="server" CloseImageUrl="~/Sources/img/valClose.png"
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldClientName"
                                    WarningIconImageUrl="~/Sources/img/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldClientId" runat="server" ControlToValidate="txtClientId"
                                    Display="None" ErrorMessage="Required: Client Id" ValidationGroup="Agreement"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldClientId_valcalout" runat="server" CloseImageUrl="~/Sources/img/valClose.png"
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldClientId"
                                    WarningIconImageUrl="~/Sources/img/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldAgreementNo" runat="server" ControlToValidate="txtAgreementNo"
                                    Display="None" ErrorMessage="Required: Agreement No" ValidationGroup="Agreement"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAgreementNo_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/img/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldAgreementNo" WarningIconImageUrl="~/Sources/img/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnInsert" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="Agreement" />
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update"
                                    ValidationGroup="Agreement" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
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
        <tr>
            <td>
                <asp:Panel ID="pnlAgreements" runat="server" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:TextBox ID="txtSearchText" Placeholder="Search by Agreement No\Client Name"
                                    runat="server" CssClass="InputTxtBox" Width="300px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" CssClass="styled-button-1" Text="Search" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdAgreements" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <asp:TemplateField HeaderText="AgreementID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgreementID" runat="server" Text='<%# Bind("AgreementID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="AgreementNo">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgreementNo" runat="server" Text='<%# Bind("AgreementNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ClientName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClientName" runat="server" Text='<%# Bind("ClientName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ClientID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClientID" runat="server" Text='<%# Bind("ClientID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="EntryBy" HeaderText="EntryBy" />
                                            <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
