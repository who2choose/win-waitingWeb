<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mysql.aspx.cs" Inherits="WinAtWaiting.mysql1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- enter command -->
        <div>
            <asp:TextBox runat="server" ID="input_input" Width="80%"></asp:TextBox>
            <a runat="server" onserverclick="buttoncommand">SUBMIT</a>
        </div>

        <!-- select [*] from [table] -->
        <br />
        <br />
        SELECT 
        <asp:TextBox runat="server" ID="tbxselect" Width="20%">*</asp:TextBox>
        FROM
        <asp:DropDownList runat="server" ID="ddlselect">
            <asp:ListItem>user</asp:ListItem>
            <asp:ListItem>tasks</asp:ListItem>
            <asp:ListItem>todo</asp:ListItem>
            <asp:ListItem>social</asp:ListItem>
        </asp:DropDownList>
        <a runat="server" onserverclick="buttonselect">SUBMIT</a>

        <!-- update [table] set [col]=[value] where [col]=[value] -->
        <br />
        <br />
        UPDATE
        <asp:DropDownList runat="server" ID="ddlupdate" AutoPostBack="true">
            <asp:ListItem>user</asp:ListItem>
            <asp:ListItem>tasks</asp:ListItem>
            <asp:ListItem>todo</asp:ListItem>
            <asp:ListItem>social</asp:ListItem>
        </asp:DropDownList>
        SET 
        <asp:TextBox runat="server" ID="tbxupdate1" Width="20%">[col]=[value]</asp:TextBox>
        WHERE 
        <asp:TextBox runat="server" ID="tbxupdate2" Width="20%">[col]=[value]</asp:TextBox>
        <a runat="server" onserverclick="buttonupdate">SUBMIT</a>

        <!-- insert into [table] values [value...] -->
        <br />
        <br />
        INSERT INTO 
        <asp:DropDownList runat="server" ID="ddlinsert" AutoPostBack="true">
            <asp:ListItem>user</asp:ListItem>
            <asp:ListItem>tasks</asp:ListItem>
            <asp:ListItem>todo</asp:ListItem>
            <asp:ListItem>social</asp:ListItem>
        </asp:DropDownList>
        VALUES 
        <asp:TextBox runat="server" ID="tbxinsert" Width="20%">(values...)</asp:TextBox>
        <a runat="server" onserverclick="buttoninsert">SUBMIT</a>

        <!-- delete from [table] where [col]=[value] -->
        <br />
        <br />
        DELETE FROM 
        <asp:DropDownList runat="server" ID="ddldelete" AutoPostBack="true">
            <asp:ListItem>user</asp:ListItem>
            <asp:ListItem>tasks</asp:ListItem>
            <asp:ListItem>todo</asp:ListItem>
            <asp:ListItem>social</asp:ListItem>
        </asp:DropDownList>
        WHERE 
        <asp:TextBox runat="server" ID="tbxdelete" Width="20%">[col]=[value]</asp:TextBox>
        <a runat="server" onserverclick="buttondelete">SUBMIT</a>

        <!-- grid view -->
        <br />
        <br />
        <div>
            <asp:GridView ID="gridview" runat="server" />
        </div>

        <asp:TextBox runat="server" ID="lastentered" Width="80%"></asp:TextBox>
    </form>
</body>
</html>
