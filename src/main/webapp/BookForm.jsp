<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="Models.Book" %>
        <jsp:include page="Layout/header.jsp" />

        <% Book book=(Book) request.getAttribute("book"); boolean isEdit=(book !=null); String title=isEdit
            ? "Update Book Details" : "New Book Acquisition" ; String description=isEdit
            ? "Modify book specifications and update historical inventory records."
            : "Enter comprehensive book details to expand the library's digital collection." ; String action=isEdit
            ? "update" : "insert" ; String gridCols=isEdit ? "1fr 1fr" : "1fr" ; %>

            <div class="page-header" style="margin-bottom: 40px;">
                <div class="page-title">
                    <h1 style="font-size: 2.25rem; font-weight: 800; letter-spacing: -0.02em; color: #1c1e21;">
                        <%= title %>
                    </h1>
                    <p style="color: #65676b; font-size: 1.125rem; margin-top: 4px;">
                        <%= description %>
                    </p>
                </div>
                <a href="Books?action=list" class="btn-secondary"
                    style="padding: 10px 20px; border-radius: 12px; font-weight: 600; background: white; border: 1px solid #dddfe2; display: flex; align-items: center; gap: 8px; text-decoration: none; color: #1c1e21;">
                    <span class="material-symbols-outlined">arrow_back</span>
                    <span>Back to Inventory</span>
                </a>
            </div>

            <div class="card"
                style="padding: 48px; max-width: 900px; border: none; box-shadow: 0 20px 40px rgba(0,0,0,0.08); border-radius: 24px; background: white; margin-bottom: 40px;">
                <form action="Books" method="post" enctype="multipart/form-data"
                    style="display: flex; flex-direction: column; gap: 32px;">
                    <input type="hidden" name="action" value="<%= action %>">
                    <% if (isEdit) { %>
                        <input type="hidden" name="id" value="<%= book.getBook_id() %>">
                        <input type="hidden" name="existing_cover_image"
                            value="<%= book.getCover_image() != null ? book.getCover_image() : "" %>">
                        <% } %>

                            <div
                                style="display: grid; grid-template-columns: 240px 1fr; gap: 48px; align-items: start;">
                                <!-- Sidebar: Cover Upload -->
                                <div class="cover-sidebar" style="position: sticky; top: 24px;">
                                    <label class="form-label"
                                        style="font-weight: 700; display: block; margin-bottom: 12px; color: #1c1e21;">Book
                                        Cover</label>
                                    <div id="imagePreview"
                                        style="width: 100%; aspect-ratio: 2/3; background: #f0f2f5; border-radius: 20px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 2px dashed #dddfe2; cursor: pointer; transition: all 0.3s ease; box-shadow: inset 0 2px 4px rgba(0,0,0,0.02);">
                                        <% if (isEdit && book.getCover_image() !=null &&
                                            !book.getCover_image().isEmpty()) { %>
                                            <img src="<%= book.getCover_image() %>"
                                                style="width: 100%; height: 100%; object-fit: cover;">
                                            <% } else { %>
                                                <div
                                                    style="display: flex; flex-direction: column; align-items: center; color: #65676b; gap: 8px;">
                                                    <span class="material-symbols-outlined"
                                                        style="font-size: 48px;">add_a_photo</span>
                                                    <span style="font-size: 0.875rem; font-weight: 600;">Upload
                                                        Cover</span>
                                                </div>
                                                <% } %>
                                    </div>
                                    <input type="file" name="cover_image_file" id="cover_image_file" accept="image/*"
                                        style="display: none;">
                                    <p
                                        style="font-size: 0.75rem; color: #8a8d91; text-align: center; margin-top: 12px; line-height: 1.4;">
                                        Click to select or drag and drop a cover image for this book.
                                    </p>
                                </div>

                                <!-- Main Content: Form Sections -->
                                <div style="display: flex; flex-direction: column; gap: 40px;">
                                    <!-- section: Basic Info -->
                                    <div style="display: flex; flex-direction: column; gap: 24px;">
                                        <h3
                                            style="font-size: 1.25rem; font-weight: 700; color: #1c1e21; border-bottom: 2px solid #f0f2f5; padding-bottom: 12px; margin: 0;">
                                            Basic Information</h3>

                                        <div class="form-group">
                                            <label class="form-label"
                                                style="font-weight: 700; display: block; margin-bottom: 8px;">Book
                                                Title</label>
                                            <div style="position: relative;">
                                                <span class="material-symbols-outlined"
                                                    style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">book</span>
                                                <input type="text" name="title" class="form-input" required
                                                    style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem;"
                                                    placeholder="The Great Gatsby"
                                                    value="<%= isEdit ? book.getTitle() : "" %>">
                                            </div>
                                        </div>

                                        <div class="form-grid"
                                            style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px;">
                                            <div class="form-group">
                                                <label class="form-label"
                                                    style="font-weight: 700; display: block; margin-bottom: 8px;">Primary
                                                    Author</label>
                                                <div style="position: relative;">
                                                    <span class="material-symbols-outlined"
                                                        style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">person</span>
                                                    <input type="text" name="author" class="form-input" required
                                                        style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem;"
                                                        placeholder="F. Scott Fitzgerald"
                                                        value="<%= isEdit ? book.getAuthor() : "" %>">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label"
                                                    style="font-weight: 700; display: block; margin-bottom: 8px;">Category
                                                    / Genre</label>
                                                <div style="position: relative;">
                                                    <span class="material-symbols-outlined"
                                                        style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">category</span>
                                                    <input type="text" name="category" class="form-input" required
                                                        style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem;"
                                                        placeholder="Fiction / Classic"
                                                        value="<%= isEdit ? book.getCategory() : "" %>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- section: Technical Details -->
                                    <div style="display: flex; flex-direction: column; gap: 24px;">
                                        <h3
                                            style="font-size: 1.25rem; font-weight: 700; color: #1c1e21; border-bottom: 2px solid #f0f2f5; padding-bottom: 12px; margin: 0;">
                                            Publication & Technical Details</h3>

                                        <div class="form-grid"
                                            style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px;">
                                            <div class="form-group">
                                                <label class="form-label"
                                                    style="font-weight: 700; display: block; margin-bottom: 8px;">ISBN
                                                    Number</label>
                                                <div style="position: relative;">
                                                    <span class="material-symbols-outlined"
                                                        style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">barcode</span>
                                                    <input type="text" name="isbn" class="form-input" required
                                                        style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem;"
                                                        placeholder="ENG-001"
                                                        value="<%= isEdit ? book.getIsbn() : "" %>">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label"
                                                    style="font-weight: 700; display: block; margin-bottom: 8px;">Publisher
                                                    Name</label>
                                                <div style="position: relative;">
                                                    <span class="material-symbols-outlined"
                                                        style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">business</span>
                                                    <input type="text" name="publisher" class="form-input" required
                                                        style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem;"
                                                        placeholder="Scribner"
                                                        value="<%= isEdit ? book.getPublisher() : "" %>">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-grid"
                                            style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px;">
                                            <div class="form-group">
                                                <label class="form-label"
                                                    style="font-weight: 700; display: block; margin-bottom: 8px;">Publication
                                                    Year</label>
                                                <div style="position: relative;">
                                                    <span class="material-symbols-outlined"
                                                        style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">calendar_today</span>
                                                    <input type="number" name="publication_year" class="form-input"
                                                        required
                                                        style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem;"
                                                        placeholder="1925"
                                                        value="<%= isEdit ? book.getPublication_year() : "" %>">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label"
                                                    style="font-weight: 700; display: block; margin-bottom: 8px;">Physical
                                                    Location</label>
                                                <div style="position: relative;">
                                                    <span class="material-symbols-outlined"
                                                        style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">place</span>
                                                    <input type="text" name="location" class="form-input" required
                                                        style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem;"
                                                        placeholder="Shelf A-12"
                                                        value="<%= isEdit ? book.getLocation() : "" %>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- section: Inventory -->
                                    <div style="display: flex; flex-direction: column; gap: 24px;">
                                        <h3
                                            style="font-size: 1.25rem; font-weight: 700; color: #1c1e21; border-bottom: 2px solid #f0f2f5; padding-bottom: 12px; margin: 0;">
                                            Inventory Status</h3>

                                        <div class="form-grid"
                                            style="display: grid; grid-template-columns: <%= gridCols %>; gap: 24px;">
                                            <div class="form-group">
                                                <label class="form-label"
                                                    style="font-weight: 700; display: block; margin-bottom: 8px;">Total
                                                    Copies Owned</label>
                                                <div style="position: relative;">
                                                    <span class="material-symbols-outlined"
                                                        style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">inventory</span>
                                                    <input type="number" name="total_copies" class="form-input" required
                                                        style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem;"
                                                        placeholder="10"
                                                        value="<%= isEdit ? book.getTotal_copies() : "" %>">
                                                </div>
                                            </div>
                                            <% if (isEdit) { %>
                                                <div class="form-group">
                                                    <label class="form-label"
                                                        style="font-weight: 700; display: block; margin-bottom: 8px;">Currently
                                                        Available</label>
                                                    <div style="position: relative;">
                                                        <span class="material-symbols-outlined"
                                                            style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #65676b; font-size: 20px;">event_available</span>
                                                        <input type="number" name="available_copies" class="form-input"
                                                            required readonly
                                                            style="width: 100%; padding: 14px 16px 14px 48px; border-radius: 12px; height: 52px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem; color: #64748b;"
                                                            placeholder="8" value="<%= book.getAvailable_copies() %>">
                                                    </div>
                                                </div>
                                                <% } %>
                                        </div>
                                    </div>

                                    <!-- section: Description -->
                                    <div class="form-group">
                                        <label class="form-label"
                                            style="font-weight: 700; display: block; margin-bottom: 8px;">Synopsis /
                                            Description</label>
                                        <div style="position: relative;">
                                            <textarea name="description" rows="4" required
                                                style="width: 100%; padding: 16px; border-radius: 12px; background: #f0f2f5; border: 1px solid transparent; font-size: 1rem; resize: vertical; min-height: 120px;"><%= isEdit ? book.getDescription() : "" %></textarea>
                                        </div>
                                    </div>

                                    <div class="form-actions"
                                        style="border-top: 2px solid #f0f2f5; padding-top: 32px; margin-top: 8px; display: flex; justify-content: flex-end; gap: 16px;">
                                        <a href="Books?action=list" class="btn-secondary"
                                            style="height: 52px; padding: 0 32px; border-radius: 14px; font-weight: 700; display: flex; align-items: center; justify-content: center; background: #f0f2f5; border: none; color: #4b5563; text-decoration: none;">Cancel
                                            Acquisition</a>
                                        <button type="submit" class="btn-primary"
                                            style="height: 52px; padding: 0 40px; border-radius: 14px; font-weight: 700; background: var(--primary-gradient); border: none; color: white; cursor: pointer; box-shadow: 0 8px 16px rgba(24, 119, 242, 0.2);">
                                            <%= isEdit ? "Update Inventory Record" : "Add to Collection" %>
                                        </button>
                                    </div>
                                </div>
                            </div>
                </form>
            </div>

            <script>
                document.getElementById('imagePreview').addEventListener('click', function () {
                    document.getElementById('cover_image_file').click();
                });

                document.getElementById('cover_image_file').addEventListener('change', function (event) {
                    const file = event.target.files[0];
                    if (file) {
                        const preview = document.getElementById('imagePreview');
                        const url = URL.createObjectURL(file);
                        const img = document.createElement('img');
                        img.src = url;
                        img.style.width = '100%';
                        img.style.height = '100%';
                        img.style.objectFit = 'cover';
                        img.onload = function () {
                            preview.innerHTML = '';
                            preview.appendChild(img);
                            preview.style.border = 'none';
                        };
                    }
                });
            </script>

            <jsp:include page="Layout/footer.jsp" />