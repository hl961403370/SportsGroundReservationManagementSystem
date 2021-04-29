<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 导入课表 </h2>
            <p class="lead"></p>
            <div class="col-md-6">
                <img src="/upload/right.jpg">
            </div>
            <div class="col-md-6" style="margin: 0 0">
                <form action="/reserve/importExcel" id="excelForm" enctype="multipart/form-data" method="post">
                    <table id="mainForm"  >
                        <tr>
                            <td> 上传文件：</td>
                            <td><input name="myfile" type="file" name="file" id="files"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-top:3em; text-align: center; padding-right: 140px;">
                                <input type="submit" value="导入excel"/></td>
                            <td> </td>
                    </table> 
                 </form>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">

</script>
<jsp:include page="bottom.jsp"/>