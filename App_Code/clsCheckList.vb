Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsCheckList
    Public con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("FileStorageConStr").ConnectionString)

    Dim _CheckListID, _CheckList, _ModifiedBy As String

    Public Property CheckListID() As String
        Get
            Return _CheckListID
        End Get
        Set(ByVal value As String)
            _CheckListID = value
        End Set
    End Property

    Public Property CheckList() As String
        Get
            Return _CheckList
        End Get
        Set(ByVal value As String)
            _CheckList = value
        End Set
    End Property

    Public Property ModifiedBy() As String
        Get
            Return _ModifiedBy
        End Get
        Set(ByVal value As String)
            _ModifiedBy = value
        End Set
    End Property

    Dim _ModificationDate As DateTime

    Public Property ModificationDate() As DateTime
        Get
            Return _ModificationDate
        End Get
        Set(ByVal value As DateTime)
            _ModificationDate = value
        End Set
    End Property

    Dim _IsActive As Boolean

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property


#Region " Insert CheckList "

    Public Function fnInsertCheckList(ByVal checklist As clsCheckList) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertCheckList", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CheckList", checklist.CheckList)
            cmd.Parameters.AddWithValue("@isActive", checklist.IsActive)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Update CheckList "

    Public Function fnUpdateCheckList(ByVal checklist As clsCheckList) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateCheckList", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CheckListID", checklist.CheckListID)
            cmd.Parameters.AddWithValue("@CheckList", checklist.CheckList)
            cmd.Parameters.AddWithValue("@IsActive", checklist.IsActive)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Get Details Check List "

    Public Function fnGetDetailsCheckList() As DataSet
        Dim sp As String = "spGetDetailsCheckList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
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

#End Region

#Region " Get Check List "

    Public Function fnGetCheckList() As DataSet
        Dim sp As String = "spGetCheckList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
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

#End Region

End Class
