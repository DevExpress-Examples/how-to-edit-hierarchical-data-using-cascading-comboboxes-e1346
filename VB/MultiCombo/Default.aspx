<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="MultiCombo._Default" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
	Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">        
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<div>

	<asp:SqlDataSource ID="dsData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
		DeleteCommand="DELETE FROM [Data] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Data] ([Title], [Description], [Category1ID], [Category2ID], [Category3ID], [Category4ID]) VALUES (@Title, @Description, @Category1ID, @Category2ID, @Category3ID, @Category4ID)" SelectCommand="SELECT * FROM [Data]"
		UpdateCommand="UPDATE [Data] SET [Title] = @Title, [Description] = @Description, [Category1ID] = @Category1ID, [Category2ID] = @Category2ID, [Category3ID] = @Category3ID, [Category4ID] = @Category4ID WHERE [ID] = @ID">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="Title" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="Category1ID" Type="Int32" />
			<asp:Parameter Name="Category2ID" Type="Int32" />
			<asp:Parameter Name="Category3ID" Type="Int32" />
			<asp:Parameter Name="Category4ID" Type="Int32" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="Title" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="Category1ID" Type="Int32" />
			<asp:Parameter Name="Category2ID" Type="Int32" />
			<asp:Parameter Name="Category3ID" Type="Int32" />
			<asp:Parameter Name="Category4ID" Type="Int32" />
		</InsertParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsCategory1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
		SelectCommand="SELECT * FROM [Category1]"></asp:SqlDataSource>

	<asp:SqlDataSource ID="dsCategory2All" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>"
		SelectCommand="SELECT ID, Name FROM Category2 ORDER BY Name">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsCategory3All" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>"
		SelectCommand="SELECT [ID], [Name] FROM [Category3] ORDER BY [Name]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsCategory4All" runat="server" EnableCaching="True" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>"
		SelectCommand="SELECT [ID], [Name] FROM [Category4] ORDER BY [Name]">
	</asp:SqlDataSource>

		<dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
			DataSourceID="dsData" KeyFieldName="ID" OnStartRowEditing="ASPxGridView1_StartRowEditing" 
			OnHtmlEditFormCreated="ASPxGridView1_HtmlEditFormCreated" OnRowUpdating="ASPxGridView1_RowUpdating" 
			OnRowInserting="ASPxGridView1_RowInserting">
			<Columns>
				<dxwgv:GridViewCommandColumn VisibleIndex="0">
					<EditButton Visible="True">
					</EditButton>
					<NewButton Visible="True">
					</NewButton>
					<DeleteButton Visible="True">
					</DeleteButton>
				</dxwgv:GridViewCommandColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
					<EditFormSettings Visible="False" />
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="Title" VisibleIndex="2">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataComboBoxColumn FieldName="Category1ID" VisibleIndex="4">
					<PropertiesComboBox DataSourceID="dsCategory1" TextField="Name" ValueField="ID" ValueType="System.Int32">
					</PropertiesComboBox>
				</dxwgv:GridViewDataComboBoxColumn>
				<dxwgv:GridViewDataComboBoxColumn FieldName="Category2ID" VisibleIndex="5">
					<PropertiesComboBox DataSourceID="dsCategory2All" TextField="Name" ValueField="ID" ValueType="System.Int32">
					</PropertiesComboBox>
				</dxwgv:GridViewDataComboBoxColumn>
				<dxwgv:GridViewDataComboBoxColumn FieldName="Category3ID" VisibleIndex="6">
					<PropertiesComboBox DataSourceID="dsCategory3All" TextField="Name"
						ValueField="ID" ValueType="System.Int32">
					</PropertiesComboBox>
				</dxwgv:GridViewDataComboBoxColumn>
				<dxwgv:GridViewDataComboBoxColumn FieldName="Category4ID" VisibleIndex="7">
					<PropertiesComboBox DataSourceID="dsCategory4All" TextField="Name"
						ValueField="ID" ValueType="System.Int32">
					</PropertiesComboBox>
				</dxwgv:GridViewDataComboBoxColumn>
</Columns>
			<Templates>
			  <EditForm>
				<table width="100%">
				<tr>
				<td style="width:50%">
					<dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Title">
					</dxe:ASPxLabel>
					<dxe:ASPxTextBox ID="ASPxTextBox1" runat="server" Text='<%#Bind("Title")%>'>
					</dxe:ASPxTextBox> 
				</td>
				<td style="width:50%">
					<dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Description">
					</dxe:ASPxLabel>
					<dxe:ASPxTextBox ID="ASPxTextBox2" runat="server" Text='<%#Bind("Description")%>'>
					</dxe:ASPxTextBox> 
				</td>
				</tr>
				<tr>
				<td colspan="2">
					<asp:UpdatePanel ID="UpdatePanel1" runat="server">
						<ContentTemplate>
	<asp:SqlDataSource ID="dsCategory3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>"
		SelectCommand="SELECT [ID], [Name] FROM [Category3] WHERE ([Category2ID] = @Category2ID) ORDER BY [Name]">
		<SelectParameters>
			<asp:SessionParameter DefaultValue="0" Name="Category2ID" SessionField="Cat2ID" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsCategory2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>"
		SelectCommand="SELECT ID, Name FROM Category2 WHERE (Category1ID = @Category1ID) ORDER BY Name">
		<SelectParameters>
			<asp:SessionParameter DefaultValue="0" Name="Category1ID" SessionField="Cat1ID" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsCategory4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>"
		SelectCommand="SELECT [ID], [Name] FROM [Category4] WHERE ([Category3ID] = @Category3ID) ORDER BY [Name]">
		<SelectParameters>
			<asp:SessionParameter DefaultValue="0" Name="Category3ID" SessionField="Cat3ID" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>
						<table width="100%">
						<tr>
						<td style="width:50%">
							<dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Category1">
							</dxe:ASPxLabel>
							<dxe:ASPxComboBox ID="Cat1" runat="server" 
							DataSourceID="dsCategory1"  TextField="Name" ValueField="ID" Value='<%#Bind("Category1ID")%>' 
							AutoPostBack="true" OnSelectedIndexChanged="Cat1_SelectedIndexChanged" ValueType="System.Int32">
							</dxe:ASPxComboBox>
						</td>
						<td style="width:50%">
							<dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Category2">
							</dxe:ASPxLabel>
							<dxe:ASPxComboBox ID="Cat2" runat="server"
							DataSourceID="dsCategory2" TextField="Name" ValueField="ID"
							AutoPostBack="true" OnSelectedIndexChanged="Cat2_SelectedIndexChanged" ValueType="System.Int32">
							</dxe:ASPxComboBox>
						</td>
						</tr>
						<tr>
						<td style="width:50%">
							<dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Category3">
							</dxe:ASPxLabel>
							<dxe:ASPxComboBox ID="Cat3" runat="server"
							DataSourceID="dsCategory3" TextField="Name" ValueField="ID"
							AutoPostBack="true" OnSelectedIndexChanged="Cat3_SelectedIndexChanged" ValueType="System.Int32">
							</dxe:ASPxComboBox>
						</td>
						<td style="width:50%">
							<dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Category4">
							</dxe:ASPxLabel>
							<dxe:ASPxComboBox ID="Cat4" runat="server"
							DataSourceID="dsCategory4" TextField="Name" ValueField="ID"
							AutoPostBack="true" ValueType="System.Int32">
							</dxe:ASPxComboBox>
						</td>
						</tr>
						</table>
						</ContentTemplate>
					</asp:UpdatePanel>
				</td>
				<td/>
				</tr>
				</table>
				   <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server" ></dxwgv:ASPxGridViewTemplateReplacement>&nbsp;&nbsp;&nbsp;
					<dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>                
				</EditForm>
				</Templates>
</dxwgv:ASPxGridView>

	</div>
	</form>
</body>
</html>
