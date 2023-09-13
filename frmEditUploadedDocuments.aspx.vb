
Partial Class frmEditUploadedDocuments
    Inherits System.Web.UI.Page

    Dim FileStorageData As New clsFileStorage()
    Dim FileCategoryData As New clsFileCategory()
    Dim DepartmentData As New clsDepartmentDataAccess()
    Dim EmpData As New clsEmployeeInfoDataAccess()
    Dim CabLocData As New clsCabinetLocation()

    Protected Sub ListFileCategoriesForEmp(ByVal EmployeeID As String)
        Try
            drpFileCategory.DataTextField = "FileCategory"
            drpFileCategory.DataValueField = "FileCategoryID"
            drpFileCategory.DataSource = FileCategoryData.fnListFileCategories()
            drpFileCategory.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ListDepartments()
        Try
            drpCustodianDept.DataTextField = "DeptName"
            drpCustodianDept.DataValueField = "DepartmentID"
            drpCustodianDept.DataSource = DepartmentData.fnGetDeptList()
            drpCustodianDept.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ListEmployees()
        Try
            drpResponsiblePerson.DataTextField = "EmployeeName"
            drpResponsiblePerson.DataValueField = "EmployeeID"
            drpResponsiblePerson.DataSource = EmpData.fnGetActiveEmpList()
            drpResponsiblePerson.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ListCabinetLocation()
        Try
            drpCabinetLocation.DataTextField = "CabinetLocation"
            drpCabinetLocation.DataValueField = "CabinetLocationID"
            drpCabinetLocation.DataSource = CabLocData.fnListCabinetLocations()
            drpCabinetLocation.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnSearchFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchFile.Click
        If Trim(txtSearchBox.Text) = "" Then
            MessageBox("Search File with a text.")
            Exit Sub
        End If
        SearchStorageFilesForEmp(Session("EmployeeID"), txtSearchBox.Text)
    End Sub

    Protected Sub SearchDocuments()
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

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub grdUploadedDocuments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdUploadedDocuments.SelectedIndexChanged
        Dim FileStorage As New clsFileStorage()
        Dim lblFileStorageID As New Label()
        Try
            lblFileStorageID = grdUploadedDocuments.SelectedRow.FindControl("lblFileStorageID")

            FileStorage = FileStorageData.fnGetFileStorageByID(lblFileStorageID.Text)

            txtReferenceNo.Text = FileStorage.ReferenceNo
            txtFileName.Text = FileStorage.FileName
            hdFldOriginalFileName.Value = FileStorage.OriginalFileName
            drpFileCategory.SelectedValue = FileStorage.FileCategoryID
            drpCustodianDept.SelectedValue = FileStorage.CustodianID
            drpResponsiblePerson.SelectedValue = FileStorage.ResponsibleID
            drpCabinetLocation.SelectedValue = FileStorage.CabinetLocationID
            txtRemarks.Text = FileStorage.Remarks
            txtEffectiveDate.Text = FileStorage.EffectiveDate
            hdFldAttachmentID.Value = FileStorage.Attachment
            hpLnkUploadedFile.NavigateUrl = ConfigurationManager.AppSettings("OutputStorageFiles") + FileStorage.Attachment
            btnUpdateDocument.Enabled = True
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim MenuIDs As String

        MenuIDs = Session("PermittedMenus")

        If InStr(MenuIDs, "EdtUpFiles~") = 0 Then
            Response.Redirect("~\Login.aspx")
        End If

        If Not IsPostBack Then
            ListFileCategoriesForEmp(Session("EmployeeID"))
            ListEmployees()
            ListDepartments()
            ListCabinetLocation()
            txtEffectiveDate.Text = Now.Date
            btnUpdateDocument.Enabled = False
        End If
    End Sub

    Protected Sub btnUpdateDocument_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateDocument.Click
        Try
            Dim folder As String = ""
            Dim Title As String = ""
            Dim DocExt As String = ""
            Dim DocFullName As String = ""
            Dim DocPrefix As String = ""
            Dim FileSize As Integer = 0
            Dim DocFileName As String = ""

            Dim FileStorage As New clsFileStorage()
            Dim Result As New clsResult()
            Dim lblFileStorageID As New Label()

            If txtRemarks.Text = "" Then
                MessageBox("Remarks/Index No Required !")
                Exit Sub
            End If

            lblFileStorageID = grdUploadedDocuments.SelectedRow.FindControl("lblFileStorageID")

            FileStorage.FileStorageID = lblFileStorageID.Text
            FileStorage.ReferenceNo = txtReferenceNo.Text
            FileStorage.FileName = txtFileName.Text
            FileStorage.FileCategoryID = drpFileCategory.SelectedValue
            FileStorage.CustodianID = drpCustodianDept.SelectedValue
            FileStorage.ResponsibleID = drpResponsiblePerson.SelectedValue
            FileStorage.CabinetLocationID = drpCabinetLocation.SelectedValue
            FileStorage.Remarks = txtRemarks.Text
            FileStorage.EffectiveDate = Convert.ToDateTime(txtEffectiveDate.Text)

            If flUpDoc.HasFile Then

                folder = ConfigurationManager.AppSettings("InputStorageFiles")

                Title = txtFileName.Text

                Title = Replace(Title, ".", "")

                FileStorage.OriginalFileName = flUpDoc.PostedFile.FileName
                FileSize = flUpDoc.PostedFile.ContentLength()
                If FileSize > 52428800 Then
                    MessageBox("File size should be within 50MB")
                    Exit Sub
                End If

                DocPrefix = Title.Replace(" ", "")

                DocExt = System.IO.Path.GetExtension(flUpDoc.FileName)
                DocFileName = "FS_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                DocFullName = folder & DocFileName
                flUpDoc.SaveAs(DocFullName)

                FileStorage.Attachment = DocFileName
            Else
                FileStorage.Attachment = hdFldAttachmentID.Value
                FileStorage.OriginalFileName = hdFldOriginalFileName.Value
            End If

            Result = FileStorage.fnUpdateFileStorage(FileStorage)
            MessageBox(Result.Message)

            If Result.Success = True Then
                ClearForm()
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearForm()
        txtEffectiveDate.Text = ""
        txtFileName.Text = ""
        txtReferenceNo.Text = ""
        txtRemarks.Text = ""
        hdFldAttachmentID.Value = ""
        hdFldAgreementID.Value = ""

        drpCabinetLocation.SelectedIndex = -1
        drpCustodianDept.SelectedIndex = -1
        drpFileCategory.SelectedIndex = -1
        drpResponsiblePerson.SelectedIndex = -1
        btnUpdateDocument.Enabled = False
        grdUploadedDocuments.SelectedIndex = -1
        SearchDocuments()
    End Sub

End Class
