
Partial Class frmAccessFile
    Inherits System.Web.UI.Page

    Dim FileIssueLogData As New clsFileIssueLog()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MyAssignedFiles(Session("EmployeeID"))
        End If
    End Sub

    Protected Sub MyAssignedFiles(ByVal EmployeeID As String)
        Try
            grdMyAssignedFiles.DataSource = FileIssueLogData.fnGetMyAssignedFiles(EmployeeID)
            grdMyAssignedFiles.DataBind()
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

End Class
