<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.HelpTopic"%>

<%
    List<HelpTopic> topics = (List<HelpTopic>) request.getAttribute("helpTopics");
    if (topics == null) {
        topics = new ArrayList<>();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pahana Edu Help Section</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body { padding: 20px; font-family: 'Poppins', sans-serif; }
        #helpSearch { max-width: 400px; display: inline-block; }
        #searchBtn { margin-left: 10px; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="mb-4">Help & User Guide</h2>

    <!-- Search Box + Button -->
    <input type="text" id="helpSearch" class="form-control" placeholder="Search help topics...">
    <button id="searchBtn" class="btn btn-primary" onclick="searchHelp()">Search</button>

    <!-- Message if no results -->
    <p id="noResults" style="display:none; margin-top:15px;">No help topics available.</p>

    <div class="accordion mt-3" id="helpAccordion">
        <% for (HelpTopic topic : topics) { %>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading<%= topic.getId() %>">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%= topic.getId() %>">
                    <%= topic.getTitle() %>
                </button>
            </h2>
            <div id="collapse<%= topic.getId() %>" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                <div class="accordion-body">
                    <%= topic.getContent() %>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<script>
    function searchHelp() {
        let input = document.getElementById('helpSearch').value.toLowerCase();
        let items = document.querySelectorAll('#helpAccordion .accordion-item');
        let visibleCount = 0;

        items.forEach(item => {
            let headerText = item.querySelector('.accordion-button').innerText.toLowerCase();
            let bodyText = item.querySelector('.accordion-body').innerText.toLowerCase();

            if (headerText.includes(input) || bodyText.includes(input)) {
                item.style.display = '';
                visibleCount++;
            } else {
                item.style.display = 'none';
            }
        });

        let noResults = document.getElementById('noResults');
        noResults.style.display = (visibleCount === 0) ? 'block' : 'none';
    }

    // Optional: show all topics on page load
    window.onload = function() {
        let items = document.querySelectorAll('#helpAccordion .accordion-item');
        items.forEach(item => item.style.display = '');
        document.getElementById('noResults').style.display = 'none';
    };
</script>
</body>
</html>
