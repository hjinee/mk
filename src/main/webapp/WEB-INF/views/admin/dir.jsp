<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %> 
<%@page import="java.util.*" %> 
<%!
    public void GetDirectory(Vector a_files, Vector a_folders) {
        String a_Path = "C:/Users/test/Desktop/folder/Smarket/src/main/webapp/upload";
        File l_Directory = new File(a_Path);
        File[] l_files = l_Directory.listFiles();

        for (int c = 0; c < l_files.length; c++) {
            if (l_files[c].isDirectory()) {
                a_folders.add(l_files[c].getName());
            } else {
                a_files.add(l_files[c].getName());
            }
        }
    }
%>
<%
    Vector l_Files = new Vector(), l_Folders = new Vector();
    GetDirectory(l_Files, l_Folders);

    for (int a = 0; a < l_Files.size(); a++) {
        out.println("<file>" + l_Files.elementAt(a).toString() + "</file>");
        out.println("<br/>");
    }

%> 