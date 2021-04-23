<%@ Page Title="" Language="C#" MasterPageFile="~/CMS.Master" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="CMSandMasterPage.Display" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCMS" runat="server">
    <h2>Display</h2>

    <div class="displayTables">
        <div>
        <h3>Main Display Table</h3>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="HearderItemID" HeaderText="HearderItemID" SortExpression="HearderItemID" />
                    <asp:BoundField DataField="JokeID" HeaderText="JokeID" SortExpression="JokeID" />
                    <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CMSDBConnectionString %>" 
                SelectCommand="SELECT * FROM [DisplaySelection] WHERE ([Id] = @Id)"
                UpdateCommand="UPDATE [DisplaySelection] SET [HearderItemID] = @HearderItemID, [JokeID] = @JokeID WHERE [Id] = @Id">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="2000" Name="Id" QueryStringField="2000" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HearderItemID" Type="Int32" />
                    <asp:Parameter Name="JokeID" Type="Int32" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div>
        <h3>Secondary Items Table</h3>
            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
                    <asp:CommandField HeaderText="Buttons" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CMSDBConnectionString %>" 
                SelectCommand="SELECT [Id], [ItemID] FROM [SecondSectionItems] WHERE ([SelectionID] = @SelectionID)"
                DeleteCommand="DELETE FROM [SecondSectionItems] WHERE [Id] = @Id"
                InsertCommand="INSERT INTO [SecondSectionItems] ([Id], [ItemID], [SelectionID]) VALUES (@Id, @ItemID, '2000')"
                UpdateCommand="UPDATE [SecondSectionItems] SET [ItemID] = @ItemID WHERE [Id] = @Id">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="2000" Name="SelectionID" QueryStringField="2000" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="ItemID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                        <asp:Parameter Name="ItemID" Type="Int32" />
                        <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div>
    
        <h3>Add Secondary Items</h3>
            <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource4" DefaultMode="Insert" Height="50px" Width="125px" OnItemInserted="DetailsView3_ItemInserted">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="ItemID" HeaderText="Item ID" SortExpression="ItemID" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            
        </div>
    </div>
    <asp:Label ID="LabelDisplay" runat="server"></asp:Label>
</asp:Content>
