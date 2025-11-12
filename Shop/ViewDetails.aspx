<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeFile="ViewDetails.aspx.cs" Inherits="Online_Medicine_Ordering.Shop.ViewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <center>
        <h1>Medicine View Details</h1>
        <br />

        <asp:DataList ID="DataList1" runat="server"
            CellPadding="10" CellSpacing="30" RepeatDirection="Horizontal"
            RepeatColumns="3" CssClass="menu_items" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <ItemTemplate>
                <div class="box">
                    <div class="img-box">
                        <asp:Image ID="Image1" runat="server" CssClass="img-fluid"
                            Height="90px" Width="136px" ImageUrl='<%# Eval("Image") %>' />
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryId") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </center>
</asp:Content>
