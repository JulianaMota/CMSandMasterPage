<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="NotLogin.aspx.cs" Inherits="CMSandMasterPage.NotLogin" Theme="ThemeNotLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeaderItem" runat="server">
        <div>
            <asp:Label ID="LabelMessage" runat="server" Text="You are not allowed to visit this page! Login First!"></asp:Label>
        </div>
        <asp:Button ID="ButtonBack" runat="server" Text="Back" OnClick="ButtonBack_Click" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderSecundaryItems" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderJokes" runat="server">
</asp:Content>
