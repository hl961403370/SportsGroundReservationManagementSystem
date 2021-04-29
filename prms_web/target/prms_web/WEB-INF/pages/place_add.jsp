<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 添加场地 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form name="addForm"  method="post" action="/place/add" id="dmin-form" enctype="multipart/form-data">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="pname" class="field prepend-icon">
                                    <input type="text" name="pname" id="pname" class="gui-input" placeholder="名称..."/>
                                    <label for="pname" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="plocation" class="field prepend-icon">
                                    <input type="text" name="plocation" id="plocation" class="gui-input" placeholder="地址..."/>
                                    <label for="plocation" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section">
                            <label for="pprofileImg" class="field prepend-icon">
                                <input name="pprofileImg" id="pprofileImg"  class="file-loading"
                                       type="file" multiple accept=".jpg,.jpeg,.png"
                                       data-show-preview="true" required>
                            </label>
                        </div>
                        <div class="section">
                            <label for="pnumber" class="field prepend-icon">
                                <input type="text" name="pnumber" id="pnumber" class="gui-input" placeholder="数量..."/>
                                <label for="pnumber" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <label for="parea" class="field prepend-icon">
                                <input type="text" name="parea" id="parea" class="gui-input" placeholder="面积..."/>
                                <label for="parea" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <label for="pintroduce" class="field prepend-icon">
                                <input type="text" name="pintroduce" id="pintroduce" class="gui-input" placeholder="介绍..."/>
                                <label for="pintroduce" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <label for="pprice" class="field prepend-icon">
                                <input type="text" name="pprice" id="pprice" class="gui-input" placeholder="价格..."/>
                                <label for="pprice" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <label for="ptype" class="field prepend-icon">
                                <select id="ptype" name="ptype">
                                    <option value ="球类">球类</option>
                                    <option value ="投掷类">投掷类</option>
                                    <option value="跳跃类">跳跃类</option>
                                    <option value="其他类">其他类</option>
                                </select>
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