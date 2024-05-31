<%@ page import="java.io.*, java.util.*, org.json.simple.parser.*, org.json.simple.*" %>
<%
// Read JSON file
JSONParser parser = new JSONParser();
JSONArray websites = new JSONArray();
try {
    FileReader reader = new FileReader("ring.json");
    websites = (JSONArray) parser.parse(reader);
    reader.close();
} catch (Exception e) {
    e.printStackTrace();
}

// Get current site index
int currentIndex = 0;
String slug = request.getParameter("slug");
for (int i = 0; i < websites.size(); i++) {
    JSONObject website = (JSONObject) websites.get(i);
    if (website.get("url").equals(slug)) {
        currentIndex = i;
        break;
    }
}

// Calculate previous site index
int prevIndex = (currentIndex - 1 + websites.size()) % websites.size();
String prevUrl = ((JSONObject) websites.get(prevIndex)).get("url").toString();

// Redirect to the previous site
response.sendRedirect(prevUrl);
%>
