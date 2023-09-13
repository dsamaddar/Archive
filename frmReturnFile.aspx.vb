
Partial Class frmReturnFile
    Inherits System.Web.UI.Page

    Dim FileIssueLogData As New clsFileIssueLog()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadYetToReturnFile(Session("EmployeeID"))
            btnProcess.Enabled = False
        End If
    End Sub

    Protected Sub LoadYetToReturnFile(ByVal EmployeeID As String)
        Try
            grdYetToReturnFile.DataSource = FileIssueLogData.fnGetYetToReturnFile(EmployeeID)
            grdYetToReturnFile.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
       
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnProcess_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcess.Click
        Try
            If hdFldIssueFileLogID.Value = "" Then
                MessageBox("Select a file to return.")
                Exit Sub
            End If

            Dim FileIssueLog As New clsFileIssueLog()
            Dim result As New clsResult()

            FileIssueLog.IssueFileLogID = hdFldIssueFileLogID.Value
            FileIssueLog.ReturnOn = Convert.ToDateTime(txtReturnOn.Text)
            FileIssueLog.ReturnRemarks = txtReturnRemarks.Text

            result = FileIssueLogData.fnReturnIssueFile(FileIssueLog)

            If result.Success = True Then
                ClearForm()
            End If

            MessageBox(result.Message)

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearForm()
        btnProcess.Enabled = False
        txtReturnOn.Text = ""
        txtReturnRemarks.Text = ""
        grdYetToReturnFile.SelectedIndex = -1
        LoadYetToReturnFile(Session("EmployeeID"))
    End Sub

    Protected Sub grdYetToReturnFile_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdYetToReturnFile.SelectedIndexChanged
        Dim lblIssueFileLogID As New Label

        lblIssueFileLogID = grdYetToReturnFile.SelectedRow.FindControl("lblIssueFileLogID")

        hdFldIssueFileLogID.Value = lblIssueFileLogID.Text

        If hdFldIssueFileLogID.Value <> "" Then
            btnProcess.Enabled = True
        End If
    End Sub
End Class
