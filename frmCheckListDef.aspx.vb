
Partial Class frmCheckListDef
    Inherits System.Web.UI.Page

    Dim CheckListData As New clsCheckList()

    Protected Sub btnInserCheckList_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInserCheckList.Click
        Dim CheckList As New clsCheckList()

        CheckList.CheckList = txtCheckListName.Text
        CheckList.ModifiedBy = Session("UserID")

        If chkRoleIsActive.Checked = True Then
            CheckList.IsActive = True
        Else
            CheckList.IsActive = False
        End If

        Dim Check As Integer = CheckListData.fnInsertCheckList(CheckList)

        If Check = 1 Then
            MessageBox("Inserted Successfully.")
            ShowDetailsRoleList()
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub ClearForm()

        grdRoleList.SelectedIndex = -1

        hdFldRoleID.Value = ""
        txtRoleName.Text = ""
        chkRoleIsActive.Checked = False

        btnInserRole.Visible = True
        btnUpdateRole.Visible = False
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub


    Protected Sub btnUpdateCheckList_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateCheckList.Click
        Dim Role As New clsRole()
        Role.RoleID = hdFldRoleID.Value
        Role.RoleName = txtRoleName.Text
        Role.LastUpdatedBy = Session("UserID")

        If chkRoleIsActive.Checked = True Then
            Role.isActive = True
        Else
            Role.isActive = False
        End If

        Dim Check As Integer = RoleData.fnUpdateRole(Role)

        If Check = 1 Then
            MessageBox("Updated Successfully.")
            ShowDetailsRoleList()
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim MenuIDs As String

        MenuIDs = Session("PermittedMenus")

        If InStr(MenuIDs, "RoleMng~") = 0 Then
            Response.Redirect("~\Login.aspx")
        End If

        If Not IsPostBack Then
            ShowDetailsRoleList()
        End If
    End Sub

    Protected Sub ShowDetailsRoleList()
        grdRoleList.DataSource = RoleData.fnGetDetailsRoleList()
        grdRoleList.DataBind()
    End Sub

End Class
