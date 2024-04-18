<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Validator.aspx.cs" Inherits="YourNamespace.Validator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Validator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000000;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 110%;
            max-width: 300px;
            background-color: #FFF;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .btn-check {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        .btn-check:hover {
            background-color: #000000;
        }

        .error {
            font-family: sans-serif;
            font-size:x-small;
            color: red;
        }

        .success {
            color: green;
        }

        h2 {
            text-align: center;
            margin-top:1px;
            margin-bottom: 20px;
            color:red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
        <h2>Validator</h2>
        <div class="form-group">
            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" required></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtFamilyName">Family Name:</label>
            <asp:TextBox ID="txtFamilyName" runat="server" required></asp:TextBox>
            <asp:CompareValidator ID="compareNameToFamilyName" ControlToValidate="txtName" ControlToCompare="txtFamilyName" Operator="NotEqual" Type="String" ErrorMessage="Name must be different from Family Name" runat="server" CssClass="error" />
        </div>
        <div class="form-group">
            <label for="txtAddress">Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" required></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexAddress" ControlToValidate="txtAddress" ValidationExpression=".{2,}" ErrorMessage="Address must be at least 2 characters long" runat="server" CssClass="error" />
        </div>
        <div class="form-group">
            <label for="txtCity">City:</label>
            <asp:TextBox ID="txtCity" runat="server" required></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexCity" ControlToValidate="txtCity" ValidationExpression=".{2,}" ErrorMessage="City must be at least 2 characters long" runat="server" CssClass="error" />
        </div>
        <div class="form-group">
            <label for="txtZipCode">Zip Code:</label>
            <asp:TextBox ID="txtZipCode" runat="server" required></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexZipCode" ControlToValidate="txtZipCode" ValidationExpression="\d{5}" ErrorMessage="Zip Code must be 5 digits" runat="server" CssClass="error" />
        </div>
        <div class="form-group">
            <label for="txtPhone">Phone:</label>
            <asp:TextBox ID="txtPhone" runat="server" required></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexPhone" ControlToValidate="txtPhone" ValidationExpression="^\d{2,3}-\d{7}$" ErrorMessage="Phone must be in the format XX-XXXXXXX or XXX-XXXXXXX" runat="server" CssClass="error" />
        </div>
        <div class="form-group">
            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" required></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexEmail" ControlToValidate="txtEmail" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" ErrorMessage="Invalid email format" runat="server" CssClass="error" />
        </div>
        <div class="form-group">
            <asp:Button ID="btnCheck" runat="server" Text="Check" OnClick="btnCheck_Click" CssClass="btn-check" />
        </div>
        <div>
            <asp:Label ID="lblValidationResult" runat="server" CssClass="error" Visible="false"></asp:Label>
        </div>

    </div>

    </form>
</body>
</html>
