<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <html>
    <head>
        <title>Add Photo</title>
    </head>
    <body>
        <h2>Add Photo</h2>
        <form id="form1" enctype="multipart/form-data" action="<%=request.getContextPath() %>/AddPhotoServlet" method="post">
            <table>
                <tr>
                    <td>Enter Photo Id :</td>
                    <td><input  type="text"  name="id"/></td>
                </tr>
                <tr>
                    <td>Enter Title For Photo :</td>
                    <td><input  type="text"  name="title"/></td>
                </tr>
                <tr>
                    <td>Select Photo  </td>
                    <td><input type="file"  name="photo" />
                </tr>
            </table>
            <p/>
            <input type="submit" value="Add Photo"/>
        </form>

      
    </body>
</html>