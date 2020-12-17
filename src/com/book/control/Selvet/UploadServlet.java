package com.book.control.Selvet;

import net.sf.json.JSONArray;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/upload")
public class UploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    }
    /*
        上传图片专用，需要给定图片名称
    */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
    //        System.out.println(req.getParameter("name"));
            Map<String,Object>map = new HashMap<String, Object>();
            map.put("msg","");
            map.put("code",0);
            String imgpath = req.getParameter("name")+".jpg";
            JSONArray jsonArray = JSONArray.fromObject(map);
            System.out.println(jsonArray.toString());
            resp.getWriter().write(jsonArray.toString());
            ServletFileUpload servletFileUpload = new
                    ServletFileUpload(fileItemFactory);
            List<FileItem> list = servletFileUpload.parseRequest(req);
            for(FileItem fileItem : list){
                if(fileItem.isFormField()){
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString("UTF-8");
                    System.out.println(name+":"+value);
                }else{
                    String fileName = fileItem.getName();
                    long size = fileItem.getSize();
                    System.out.println(fileName+":"+size+"Byte");
                    InputStream inputStream = fileItem.getInputStream();
                    String path = req.getServletContext().getRealPath("img/"+imgpath);
                    OutputStream outputStream = new FileOutputStream(path);
                    int temp = 0;
                    while((temp = inputStream.read())!=-1){
                        outputStream.write(temp);
                    }
                    outputStream.close();
                    inputStream.close();
                    System.out.println("上传成功");
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }
}
