<%@ Page Language="VB" MasterPageFile="~/FileStorage.master" AutoEventWireup="false" CodeFile="frmCheckListDef.aspx.vb" Inherits="frmCheckListDef" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlRoleManagement" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widgettitle">
                                    Checklist Definition<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td style="width: 150px">
                                &nbsp;
                            </td>
                            <td style="width: 230px">
                                <asp:HiddenField ID="hdFldRoleID" runat="server" />
                            </td>
                            <td style="width: 300px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Checklist Name</td>
                            <td>
                                <asp:TextBox ID="txtCheckListName" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldRoleName" runat="server" ControlToValidate="txtCheckListName"
                                    Display="None" ErrorMessage="Checklist Name Required" 
                                    ValidationGroup="AddRole"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRoleName_ValidatorCalloutExtender0" runat="server"
                                    Enabled="True" TargetControlID="reqFldRoleName">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Is Active
                            </td>
                            <td>
                                <asp:CheckBox ID="chkRoleIsActive" runat="server" Text="Is Active" CssClass="chkText" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnInserCheckList" runat="server" Text="Insert Checklist" CssClass="styled-button-1"
                                    ValidationGroup="AddRole" />
                                &nbsp;<asp:Button ID="btnUpdateCheckList" runat="server" 
                                    Text="Update Checklist" CssClass="styled-button-1"
                                    Visible="False" ValidationGroup="AddRole" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" Text="Cancel" CssClass="styled-button-1" />
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
                <asp:Panel ID="pnlRoleList" runat="server" SkinID="pnlInner" Width="700px">
                    <div style="max-height: 300px; max-width: 680px; overflow: auto">
                        <asp:GridView ID="grdRoleList" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RoleID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRoleID" runat="server" Text='<%# Bind("RoleID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Role">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRoleName" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active">
                                    <ItemTemplate>
                                        <asp:Label ID="lblisActive" runat="server" Text='<%# Bind("isActive") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Created-By">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("CreatedBy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CreatedDate">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>

