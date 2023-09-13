
Partial Class frmIssueFile
    Inherits System.Web.UI.Page

    Dim EmpData As New clsEmployeeInfoDataAccess()
    Dim FileStorageData As New clsFileStorage()
    Dim FileIssueLogData As New clsFileIssueLog()

    Protected Sub btnProcess_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcess.Click
        Try
            Dim FileIssueLog As New clsFileIssueLog()
            Dim Result As New clsResult()

            FileIssueLog.FileStorageID = hdFldFileStorageID.Value
            FileIssueLog.IssueTo = drpIssueTo.SelectedValue
            FileIssueLog.IssueOn = Convert.ToDateTime(txtIssueOn.Text)
            FileIssueLog.ReturnDeadLine = Convert.ToDateTime(txtReturnDeadLine.Text)
            FileIssueLog.IssueRemarks = txtIssueRemarks.Text
            FileIssueLog.IssueBy = Session("EmployeeID")

            If chkbxFilePermission.Items(0).Selected = True Then
                FileIssueLog.IsOnlineCopy = True
            End If

            If chkbxFilePermission.Items(1).Selected = True Then
                FileIssueLog.IsOfflineCopy = True
            End If

            Result = FileIssueLogData.fnInsertIssueFile(FileIssueLog)

            MessageBox(Result.Message)

            If Result.Success = True Then

                ClearForm()
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearForm()
        lReferenceNo.Text = ""
        lCustodian.Text = ""
        lResponsiblePerson.Text = ""
        txtIssueOn.Text = ""
        txtIssueRemarks.Text = ""
        txtReturnDeadLine.Text = ""
        btnProcess.Enabled = False

        For Each item As ListItem In chkbxFilePermission.Items
            item.Selected = False
            item.Enabled = True
        Next

        grdUploadedDocuments.SelectedIndex = -1
        grdUploadedDocuments.DataSource = ""
        grdUploadedDocuments.DataBind()

        SearchStorageFilesForEmp(Session("EmployeeID"), txtSearchBox.Text)
    End Sub

    Protected Sub btnSearchFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchFile.Click

        If Trim(txtSearchBox.Text) = "" Then
            MessageBox("Search File with a text.")
            Exit Sub
        End If
        SearchStorageFilesForEmp(Session("EmployeeID"), txtSearchBox.Text)
    End Sub

    Protected Sub SearchStorageFilesForEmp(ByVal EmployeeID As String, ByVal SearchText As String)
        grdUploadedDocuments.DataSource = FileStorageData.fnSearchStorageFiles(EmployeeID, SearchText)
        grdUploadedDocuments.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            btnProcess.Enabled = False
            ListEmployees()
        End If
    End Sub

    Protected Sub ListEmployees()
        Try
            drpIssueTo.DataTextField = "EmployeeName"
            drpIssueTo.DataValueField = "EmployeeID"
            drpIssueTo.DataSource = EmpData.fnGetActiveEmpList()
            drpIssueTo.DataBind()
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

    Protected Sub grdUploadedDocuments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdUploadedDocuments.SelectedIndexChanged

        Try
            Dim lblFileStorageID, lblReferenceNo, lblCustodian, lblResponsible, lblIsIssued, lblLastIssuedBy, lblLastIssuedOn, lblStatus As New Label

            lblFileStorageID = grdUploadedDocuments.SelectedRow.FindControl("lblFileStorageID")
            lblReferenceNo = grdUploadedDocuments.SelectedRow.FindControl("lblReferenceNo")
            lblCustodian = grdUploadedDocuments.SelectedRow.FindControl("lblCustodian")
            lblResponsible = grdUploadedDocuments.SelectedRow.FindControl("lblResponsible")
            lblIsIssued = grdUploadedDocuments.SelectedRow.FindControl("lblIsIssued")
            lblLastIssuedBy = grdUploadedDocuments.SelectedRow.FindControl("lblLastIssuedBy")
            lblLastIssuedOn = grdUploadedDocuments.SelectedRow.FindControl("lblLastIssuedOn")
            lblStatus = grdUploadedDocuments.SelectedRow.FindControl("lblStatus")

            hdFldFileStorageID.Value = lblFileStorageID.Text
            lReferenceNo.Text = lblReferenceNo.Text
            lCustodian.Text = lblCustodian.Text
            lResponsiblePerson.Text = lblResponsible.Text

            For Each item As ListItem In chkbxFilePermission.Items
                item.Selected = False
                item.Enabled = True
            Next


            If hdFldFileStorageID.Value <> "" Then
                If lblStatus.Text = "Online Copy Available" Then
                    chkbxFilePermission.Items(1).Enabled = False
                    lFileIssueStatus.Text = "File Issued to " & lblLastIssuedBy.Text & " on " & FormatDateTime(lblLastIssuedOn.Text, DateFormat.ShortDate) & " | " & lblStatus.Text
                    lFileIssueStatus.ForeColor = Drawing.Color.Red
                Else
                    lFileIssueStatus.Text = lblStatus.Text
                    lFileIssueStatus.ForeColor = Drawing.Color.Green
                End If

                btnProcess.Enabled = True
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
