<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="../layout/page_head.jsp" />

<jsp:include page="../layout/content_navbar_admin.jsp" />

<div class="container">
    <h1>Category Managemnet
        <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#addCategoryDialog">
            <span class="glyphicon glyphicon-plus"></span>
        </button>
    </h1>
    <div class="alert alert-info fade in" role="alert"><span class="glyphicon glyphicon-time"></span> Loading category information...</div>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Category Type</th>
                    <th>Time of creation</th>
                    <th>Time of modification</th>
                    <th>Operation</th>
                </tr>
            </thead>
            <tbody id="mainTable">
            <!-- Table data will be loaded by js. -->
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="addCategoryDialog" tabindex="-1" role="dialog" aria-labelledby="addCategoryDialogLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addCategoryDialogLabel">Add Category</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" id="addCategoryName" placeholder="Category Name">
                        </div>
                    </div>
                </form>
                <p id="addCategoryStatus"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="btnAddCategory">Add</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="updateCategoryDialog" tabindex="-1" role="dialog" aria-labelledby="updateCategoryDialogLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="updateCategoryDialogLabel">Modify Category Name</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="text" class="form-control hidden" id="updateCategoryId">
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" id="updateCategoryName" placeholder="Category Name">
                        </div>
                    </div>
                </form>
                <p id="updateCategoryStatus"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" id="btnUpdateCategory">Update</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteCategoryDialog" tabindex="-1" role="dialog" aria-labelledby="deleteCategoryDialogLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="deleteCategoryDialogLabel">Delete Category/h4>
            </div>
            <div class="modal-body">
                <p id="deleteCategoryText"></p>
                <input type="text" class="form-control hidden" id="deleteCategoryId">
                <p id="deleteCategoryStatus"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="btnDeleteCategory">Delete</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="categoryDetailDialog" tabindex="-1" role="dialog" aria-labelledby="categoryDetailDialogLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="categoryDetailDialogLabel">Category Detail</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Book ID</th>
                                <th>Book Name</th>
                                <th>Operation</th>
                            </tr>
                        </thead>
                        <tbody id="detailTable">
                        <!-- Table data will be loaded by js. -->
                        </tbody>
                    </table>
                </div>
                <p id="categoryDetailStatus"></p>  
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addBookToCategoryDialog" tabindex="-1" role="dialog" aria-labelledby="addBookToCategoryDialogLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addBookToCategoryDialogLabel">Add book to the category</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="text" class="form-control hidden" id="addBookToCategoryCategoryId">
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="number" class="form-control" id="addBookToCategoryBookId" min="1" placeholder="Enter the book id ot add to this category">
                        </div>
                    </div>
                </form>
                <p id="addBookToCategoryStatus"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="btnAddBookToCategory">Add</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../profile.jsp" />

<jsp:include page="../layout/content_footer.jsp" />

<jsp:include page="../layout/common_js.jsp" />

<script src="<s:url value="/js/admin/category.js"/>"></script>
<script src="<s:url value="/js/profile.js"/>"></script>

<jsp:include page="../layout/page_end.jsp" />

