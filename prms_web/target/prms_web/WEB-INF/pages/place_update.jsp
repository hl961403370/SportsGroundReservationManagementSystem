<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 编辑场地 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form name="updateForm"  method="post" action="/place/update" id="dmin-form" enctype="multipart/form-data">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <h3>场地编号</h3>
                                <label for="pid" class="field prepend-icon">
                                    <input type="text" name="pid" id="pid" class="gui-input" placeholder="编号..." value="${place.pid}" readonly="true"/>
                                    <label for="pid" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <h3>场地名称</h3>
                                <label for="pname" class="field prepend-icon">
                                    <input type="text" name="pname" id="pname" class="gui-input" placeholder="名称..." value="${place.pname}" readonly="true"/>
                                    <label for="pname" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section">
                            <h3>场地位置</h3>
                            <label for="plocation" class="field prepend-icon">
                                <input type="text" name="plocation" id="plocation" class="gui-input" placeholder="地址..." value="${place.plocation}"/>
                                <label for="plocation" class="field-icon">
                                    <i class="fa fa-user"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>场地图片</h3>
                            <label for="pprofileImg" class="field prepend-icon">
                                <input name="pprofileImg" id="pprofileImg"  class="file-loading"
                                       type="file" multiple accept=".jpg,.jpeg,.png"
                                       data-show-preview="true" >
                                <img src=${place.pprofileImg} class="img-responsive">
                                <input name="img" type="hidden" value="${place.pprofileImg}">
                            </label>
                        </div>
                        <div class="section">
                            <h3>场地数量</h3>
                            <label for="pnumber" class="field prepend-icon">
                                <input type="text" name="pnumber" id="pnumber" class="gui-input" placeholder="数量..." value="${place.pnumber}"/>
                                <label for="pnumber" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>场地面积</h3>
                            <label for="parea" class="field prepend-icon">
                                <input type="text" name="parea" id="parea" class="gui-input" placeholder="面积..." value="${place.parea}"/>
                                <label for="parea" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>场地介绍</h3>
                            <label for="pintroduce" class="field prepend-icon">
                                <input type="text" name="pintroduce" id="pintroduce" class="gui-input" placeholder="介绍..." value="${place.pintroduce}"/>
                                <label for="pintroduce" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>场地类型</h3>
                            <label for="ptype" class="field prepend-icon">
                                <select id="ptype" name="ptype">
                                    <c:choose>
                                        <c:when test="${place.ptype eq '球类'}">
                                            <option value ="球类" selected>球类</option>
                                            <option value ="投掷类">投掷类</option>
                                            <option value="跳跃类">跳跃类</option>
                                            <option value="其他类">其他类</option>
                                        </c:when>
                                        <c:when test="${place.ptype eq '投掷类'}">
                                            <option value ="球类">球类</option>
                                            <option value ="投掷类" selected>投掷类</option>
                                            <option value="跳跃类">跳跃类</option>
                                            <option value="其他类">其他类</option>
                                        </c:when>
                                        <c:when test="${place.ptype eq '跳跃类'}">
                                            <option value ="球类">球类</option>
                                            <option value ="投掷类">投掷类</option>
                                            <option value="跳跃类" selected>跳跃类</option>
                                            <option value="其他类">其他类</option>
                                        </c:when>
                                        <c:when test="${place.ptype eq '其他类'}">
                                            <option value ="球类">球类</option>
                                            <option value ="投掷类">投掷类</option>
                                            <option value="跳跃类">跳跃类</option>
                                            <option value="其他类" selected>其他类</option>
                                        </c:when>
                                    </c:choose>
                                </select>
                            </label>
                        </div>
                        <div class="section">
                            <h3>场地状态</h3>
                            <label for="pstatus" class="field prepend-icon">
                                <input type="text" name="pstatus" id="pstatus" class="gui-input" placeholder="状态..." value="${place.pstatus}"/>
                                <label for="pstatus" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>场地价格</h3>
                            <label for="pprice" class="field prepend-icon">
                                <input type="text" name="pprice" id="pprice" class="gui-input" placeholder="价格..." value="${place.pprice}"/>
                                <label for="pprice" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 保存 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>