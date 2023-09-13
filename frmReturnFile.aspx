<%@ Page Language="VB" MasterPageFile="~/FileStorage.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmReturnFile.aspx.vb" Inherits="frmReturnFile"
    Title=".:Archive:Return File:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlReturnFile" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Return File</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <asp:GridView ID="grdYetToReturnFile" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IssueFileLogID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIssueFileLogID" runat="server" Text='<%# Bind("IssueFileLogID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ReferenceNo" HeaderText="ReferenceNo" />
                                            <asp:BoundField DataField="Custodian" HeaderText="Custodian" />
                                            <asp:BoundField DataField="IssueOn" HeaderText="IssueOn" />
                                            <asp:BoundField DataField="IssueRemarks" HeaderText="IssueRemarks" />
                                            <asp:BoundField DataField="IssueTo" HeaderText="IssueTo" />
                                            <asp:BoundField DataField="IssueBy" HeaderText="IssueBy" />
                                            <asp:BoundField DataField="ReturnDeadLine" HeaderText="DeadLine" />
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
                <asp:Panel ID="pnlProcessReturn" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                                <asp:HiddenField ID="hdFldIssueFileLogID" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Returned on
                            </td>
                            <td>
                                <asp:TextBox ID="txtReturnOn" runat="server" CssClass="InputTxtBox" type="date" 
                                    Width="150px" ValidationGroup="ReturnFile"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldReturnOn" runat="server" ControlToValidate="txtReturnOn"
                                    ErrorMessage="Required : Return Date" ValidationGroup="ReturnFile" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldReturnOn_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/img/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldReturnOn" WarningIconImageUrl="~/Sources/img/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Remarks</td>
                            <td>
                                <asp:TextBox ID="txtReturnRemarks" runat="server" TextMode="MultiLine" 
                                    ValidationGroup="ReturnFile" Width="200px" CssClass="InputTxtBox"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldReturnRemarks" runat="server" 
                                    ControlToValidate="txtReturnRemarks" Display="None" 
                                    ErrorMessage="Required: Remarks" ValidationGroup="ReturnFile"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldReturnRemarks_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/img/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldReturnRemarks" 
                                    WarningIconImageUrl="~/Sources/img/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnProcess" runat="server" CssClass="styled-button-1" 
                                    Text="Process Return File" ValidationGroup="ReturnFile" />
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
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
