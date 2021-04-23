<%@ Page Title="" Language="C#" MasterPageFile="~/CMS.Master" AutoEventWireup="true" CodeBehind="PicturesUpload.aspx.cs" Inherits="CMSandMasterPage.PicturesUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCMS" runat="server">
    <div class="upload-container">
        <h2>Upload Pictures</h2>

        <asp:Label ID="LabelSelect" runat="server" Text="Select a Picture to Upload"></asp:Label>
        <asp:FileUpload ID="FileUpload" runat="server" />


        <asp:Label ID="LabelNewName" runat="server" Text="New File Name"></asp:Label>

        <asp:TextBox ID="TextBoxFileName" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonUpload" runat="server" OnClick="ButtonUpload_Click" Text="Upload" />

        <asp:Label ID="LabelMessage" runat="server"></asp:Label>
    </div>

</asp:Content>
