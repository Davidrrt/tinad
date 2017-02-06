<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<%
    File file ;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    String filePath = "/src/main/webapp/img/";

    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
//        factory.setRepository(new File("c:\\temp"));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax( maxFileSize );
        try{
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();
            out.println("<html>");
            out.println("<body>");
            while ( i.hasNext () )
            {
                FileItem fi = (FileItem)i.next();
                if ( !fi.isFormField () )  {
//                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
//                    boolean isInMemory = fi.isInMemory();
//                    long sizeInBytes = fi.getSize();
                    file = new File( filePath + fileName) ;
                    fi.write( file ) ;
                    out.println("<img src='img/" + fileName + "' />");
                }
            }
            out.println("</body>");
            out.println("</html>");
        }catch(Exception ex) {
            System.out.println(ex);
            ex.printStackTrace();
        }
    }else{
        out.println("<html>");
        out.println("<body>");
        out.println("<p>No file uploaded</p>");
        out.println("</body>");
        out.println("</html>");
    }
%>