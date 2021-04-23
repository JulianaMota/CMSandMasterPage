<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ContentDisplay.aspx.cs" Inherits="CMSandMasterPage.ContentDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeaderItem" runat="server">

 

    <asp:Repeater ID="RepeaterHeaderItem" runat="server">
        <ItemTemplate>          
            <tr>
                <td><h2><%# Eval("Headline") %></h2></td>
                <td><img src="images/<%# Eval("Picture") %>.jpg"/></td>
                <td><p class="caption"><%# Eval("PictureCaption") %></p></td>
                <td><p><%# Eval("Description") %></p></td>
            </tr>           
        </ItemTemplate>
    </asp:Repeater>

   <asp:Label ID="LabelMessageHeader" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderSecundaryItems" runat="server">
    <h2>More Products</h2>
    <section class="list">
    <asp:Repeater ID="RepeaterSeundaryItems" runat="server">
        <ItemTemplate>
            <tr>
                <div>   
                    <td><h3><%# Eval("Headline") %></h3></td>
                    <td><img src="images/<%# Eval("Picture") %>.jpg"/></td>
                    <td><p class="caption"><%# Eval("PictureCaption") %></p></td>
                    <td><p><%# Eval("Description") %></p></td>
                    
                </div>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    </section>
   <asp:Label ID="LabelMessageSec" runat="server"></asp:Label>


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderJokes" runat="server">

    <asp:Repeater ID="RepeaterJoke" runat="server">
        <ItemTemplate>
            <tr>
                <td><p><%# Eval("JokeQuestion") %></p></td>
                <td><img src="images/<%# Eval("JokeImage") %>.png"/></td>
                <td><p class="caption"><%# Eval("ImageCaption") %></p></td>
                <td><p><%# Eval("JokeAnswer") %></p></td>

            </tr>
        </ItemTemplate>
    </asp:Repeater>

   <asp:Label ID="LabelMessageJoke" runat="server"></asp:Label>


</asp:Content>
