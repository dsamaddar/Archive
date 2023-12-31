﻿Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Imports System


Public Class clsUserWiseRoleDataAccess

    Public con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("FileStorageConStr").ConnectionString)
    Public conHRM As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert User Wise Role "

    Public Function fnInsertUserWiseRole(ByVal UserWiseRole As clsUserWiseRole) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertUserWiseRole", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@UniqueUserID", UserWiseRole.UniqueUserID)
            cmd.Parameters.AddWithValue("@RoleID", UserWiseRole.RoleID)
            cmd.Parameters.AddWithValue("@EntryBy", UserWiseRole.EntryBy)
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

#Region " Deactivate User Permission "

    Public Function fnInActiveUsrPermission(ByVal UserWiseRole As clsUserWiseRole) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInActiveUsrPermission", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@UserWiseRoleID", UserWiseRole.UserWiseRoleID)
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

#Region " Show User Wise Role "

    Public Function fnShowUserWiseRole(ByVal UserWiseRole As clsUserWiseRole) As DataSet

        Dim sp As String = "spShowUserWiseRole"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UniqueUserID", UserWiseRole.UniqueUserID)
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

#Region " Get User Permission "

    Public Function fnGetUserPermission(ByVal UserWiseRole As clsUserWiseRole) As String

        Dim sp As String = "spGetUserPermission"
        Dim MenuIDs As String = ""
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UniqueUserID", UserWiseRole.UniqueUserID)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    MenuIDs = dr.Item("MenuIDs")
                End While
                con.Close()
                Return MenuIDs
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
