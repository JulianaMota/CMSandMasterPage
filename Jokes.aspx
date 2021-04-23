<%@ Page Title="" Language="C#" MasterPageFile="~/CMS.Master" AutoEventWireup="true" CodeBehind="Jokes.aspx.cs" Inherits="CMSandMasterPage.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCMS" runat="server">
        <h2>Jokes</h2>

    <h3> Jokes Table</h3>
    <asp:Label ID="LabelJokesMess" runat="server"></asp:Label>
    <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="JokeId" DataSourceID="SqlDataSource2" AllowSorting="True">
        <Columns>
            <asp:CommandField HeaderText="Buttons" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
            <asp:BoundField DataField="JokeId" HeaderText="JokeId" ReadOnly="True" SortExpression="JokeId" />
            <asp:BoundField DataField="JokeQuestion" HeaderText="JokeQuestion" SortExpression="JokeQuestion" />    
            <asp:BoundField DataField="JokeAnswer" HeaderText="JokeAnswer" SortExpression="JokeAnswer" />
            <asp:BoundField DataField="JokeImage" HeaderText="JokeImage" SortExpression="JokeImage" />
            <asp:ImageField DataImageUrlField="JokeImage" DataImageUrlFormatString="~/images/{0}.png" HeaderText="Image" ReadOnly="True"></asp:ImageField>
            <asp:BoundField DataField="ImageCaption" HeaderText="ImageCaption" SortExpression="ImageCaption" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CMSDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Jokes]"
        DeleteCommand="DELETE FROM [Jokes] WHERE [JokeId] = @JokeId"
        InsertCommand="INSERT INTO [Jokes] ([JokeId], [JokeQuestion], [JokeImage], [JokeAnswer], [ImageCaption]) VALUES (@JokeId, @JokeQuestion, @JokeImage, @JokeAnswer, @ImageCaption)"
        UpdateCommand="UPDATE [Jokes] SET [JokeQuestion]=@JokeQuestion, [JokeImage] = @JokeImage, [JokeAnswer] = @JokeAnswer, [ImageCaption] = @ImageCaption WHERE [JokeId] = @JokeId">
        <DeleteParameters>
            <asp:Parameter Name="JokeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="JokeId" Type="Int32" />
            <asp:Parameter Name="JokeQuestion" Type="String" />
            <asp:Parameter Name="JokeImage" Type="String" />
            <asp:Parameter Name="JokeAnswer" Type="String" />
            <asp:Parameter Name="ImageCaption" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="JokeQuestion" Type="String" />
            <asp:Parameter Name="JokeImage" Type="String" />
            <asp:Parameter Name="JokeAnswer" Type="String" />
            <asp:Parameter Name="ImageCaption" Type="String" />
            <asp:Parameter Name="JokeId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <h3>Add new Joke</h3>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="JokeId" DataSourceID="SqlDataSource2" DefaultMode="Insert" Height="50px" Width="125px" OnItemInserted="DetailsView2_ItemInserted">
        <Fields>
            <asp:BoundField DataField="JokeId" HeaderText="Joke Id" ReadOnly="True" SortExpression="JokeId" />
            <asp:BoundField DataField="JokeQuestion" HeaderText="Joke Question" SortExpression="JokeQuestion" />
            <asp:BoundField DataField="JokeAnswer" HeaderText="Joke Answer" SortExpression="JokeAnswer" />
            <asp:BoundField DataField="JokeImage" HeaderText="Joke Image" SortExpression="JokeImage" />
            <asp:BoundField DataField="ImageCaption" HeaderText="Image Caption" SortExpression="ImageCaption" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
        
</asp:Content>
