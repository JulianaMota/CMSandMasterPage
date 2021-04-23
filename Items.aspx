<%@ Page Title="" Language="C#" MasterPageFile="~/CMS.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="CMSandMasterPage.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCMS" runat="server">
    
    <h2>Items</h2>

    <h3>Items table</h3>
    <asp:Label ID="LabelItmesMess" runat="server"></asp:Label>
    <asp:GridView ID="GridViewItems" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" AllowSorting="True">
        <Columns>
            <asp:CommandField HeaderText="Buttons" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
            <asp:BoundField DataField="ItemId" HeaderText="Item Id" ReadOnly="True" SortExpression="ItemId" />
            <asp:BoundField DataField="ItemCategory" HeaderText="Item Category" SortExpression="ItemCategory" />
            <asp:BoundField DataField="Headline" HeaderText="Headline" SortExpression="Headline" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"/>
            <asp:BoundField DataField="Picture" HeaderText="Picture" SortExpression="Picture" />
            <asp:ImageField DataImageUrlField="Picture" DataImageUrlFormatString="~/images/{0}.jpg" HeaderText="Picture" ReadOnly="True"></asp:ImageField>
            <asp:BoundField DataField="PictureCaption" HeaderText="Picture Caption" SortExpression="PictureCaption" />
        </Columns>
    </asp:GridView>
  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CMSDBConnectionString %>"
        DeleteCommand="DELETE FROM [Items] WHERE [ItemId] = @ItemId"
        InsertCommand="INSERT INTO [Items] ([ItemId], [ItemCategory], [Headline], [Picture], [Description], [PictureCaption]) VALUES (@ItemId, 'Bicycle', @Headline, @Picture, @Description, @PictureCaption)"
        SelectCommand="SELECT * FROM [Items] WHERE [ItemCategory] = 'Bicycle'"
        UpdateCommand="UPDATE [Items] SET [ItemCategory]=@ItemCategory, [Headline] = @Headline, [Picture] = @Picture, [Description] = @Description, [PictureCaption] = @PictureCaption WHERE [ItemId] = @ItemId">
        <DeleteParameters>
            <asp:Parameter Name="ItemId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemId" Type="Int32" />
            <asp:Parameter Name="ItemCategory" Type="String" />
            <asp:Parameter Name="Headline" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="PictureCaption" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemCategory" Type="String" />
            <asp:Parameter Name="Headline" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="PictureCaption" Type="String" />
            <asp:Parameter Name="ItemId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <h3>Add an Item</h3>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px" OnItemInserted="DetailsView1_ItemInserted">
        <Fields>
            <asp:BoundField DataField="ItemId" HeaderText="ItemId" ReadOnly="True" SortExpression="ItemId" />
            <asp:BoundField DataField="Headline" HeaderText="Headline" SortExpression="Headline" />
            <asp:BoundField DataField="Picture" HeaderText="Picture" SortExpression="Picture" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="PictureCaption" HeaderText="PictureCaption" SortExpression="PictureCaption" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
</asp:Content>
