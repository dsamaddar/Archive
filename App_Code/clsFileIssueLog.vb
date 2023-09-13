Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System
Imports System.Configuration

Public Class clsFileIssueLog

    Public con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("FileStorageConStr").ConnectionString)

    Dim _IssueFileLogID, _FileStorageID, _IssueTo, _IssueBy, _IssueRemarks, _ReturnRemarks As String

    Public Property IssueFileLogID() As String
        Get
            Return _IssueFileLogID
        End Get
        Set(ByVal value As String)
            _IssueFileLogID = value
        End Set
    End Property

    Public Property FileStorageID() As String
        Get
            Return _FileStorageID
        End Get
        Set(ByVal value As String)
            _FileStorageID = value
        End Set
    End Property

    Public Property IssueTo() As String
        Get
            Return _IssueTo
        End Get
        Set(ByVal value As String)
            _IssueTo = value
        End Set
    End Property

    Public Property IssueBy() As String
        Get
            Return _IssueBy
        End Get
        Set(ByVal value As String)
            _IssueBy = value
        End Set
    End Property

    Public Property IssueRemarks() As String
        Get
            Return _IssueRemarks
        End Get
        Set(ByVal value As String)
            _IssueRemarks = value
        End Set
    End Property

    Public Property ReturnRemarks() As String
        Get
            Return _ReturnRemarks
        End Get
        Set(ByVal value As String)
            _ReturnRemarks = value
        End Set
    End Property

    Dim _IssueOn, _ReturnDeadLine, _ReturnOn, _EntryDate As Date

    Public Property IssueOn() As Date
        Get
            Return _IssueOn
        End Get
        Set(ByVal value As Date)
            _IssueOn = value
        End Set
    End Property

    Public Property ReturnDeadLine() As Date
        Get
            Return _ReturnDeadLine
        End Get
        Set(ByVal value As Date)
            _ReturnDeadLine = value
        End Set
    End Property

    Public Property ReturnOn() As Date
        Get
            Return _ReturnOn
        End Get
        Set(ByVal value As Date)
            _ReturnOn = value
        End Set
    End Property

    Public Property EntryDate() As Date
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As Date)
            _EntryDate = value
        End Set
    End Property

    Dim _IsReturned, _IsOnlineCopy, _IsOfflineCopy As Boolean

    Public Property IsOnlineCopy() As Boolean
        Get
            Return _IsOnlineCopy
        End Get
        Set(ByVal value As Boolean)
            _IsOnlineCopy = value
        End Set
    End Property

    Public Property IsOfflineCopy() As Boolean
        Get
            Return _IsOfflineCopy
        End Get
        Set(ByVal value As Boolean)
            _IsOfflineCopy = value
        End Set
    End Property

    Public Property IsReturned() As Boolean
        Get
            Return _IsReturned
        End Get
        Set(ByVal value As Boolean)
            _IsReturned = value
        End Set
    End Property

    Public Function fnInsertIssueFile(ByVal FileIssueLog As clsFileIssueLog) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertIssueFile", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@FileStorageID", FileIssueLog.FileStorageID)
            cmd.Parameters.AddWithValue("@IssueTo", FileIssueLog.IssueTo)
            cmd.Parameters.AddWithValue("@IssueOn", FileIssueLog.IssueOn)
            cmd.Parameters.AddWithValue("@IssueBy", FileIssueLog.IssueBy)
            cmd.Parameters.AddWithValue("@IssueRemarks", FileIssueLog.IssueRemarks)
            cmd.Parameters.AddWithValue("@IsOnlineCopy", FileIssueLog.IsOnlineCopy)
            cmd.Parameters.AddWithValue("@IsOfflineCopy", FileIssueLog.IsOfflineCopy)
            cmd.Parameters.AddWithValue("@ReturnDeadLine", FileIssueLog.ReturnDeadLine)
            cmd.ExecuteNonQuery()
            con.Close()
            Result.Success = True
            Result.Message = "File: Issued Successfully."
            Return Result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Result.Success = False
            Result.Message = "Error Found: " & ex.Message
            Return Result
        End Try
    End Function

    Public Function fnReturnIssueFile(ByVal FileIssueLog As clsFileIssueLog) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spReturnIssueFile", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IssueFileLogID", FileIssueLog.IssueFileLogID)
            cmd.Parameters.AddWithValue("@ReturnOn", FileIssueLog.ReturnOn)
            cmd.Parameters.AddWithValue("@ReturnRemarks", FileIssueLog.ReturnRemarks)
            cmd.ExecuteNonQuery()
            con.Close()
            Result.Success = True
            Result.Message = "File: Returned Successfully."
            Return Result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Result.Success = False
            Result.Message = "Error Found: " & ex.Message
            Return Result
        End Try
    End Function

    Public Function fnGetYetToReturnFile(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spGetYetToReturnFile"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetMyAssignedFiles(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spGetMyAssignedFiles"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class
