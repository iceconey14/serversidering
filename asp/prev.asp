<%
Dim sites, siteIndex, fs, f, ts, slug
Set fs = Server.CreateObject("Scripting.FileSystemObject")
Set f = fs.OpenTextFile(Server.MapPath("sites.txt"), 1)
sites = Split(f.ReadAll(), vbCrLf)
f.Close
slug = Request.QueryString("slug")
For i = 0 To UBound(sites)
    If InStr(sites(i), "slug'" & slug & "'") > 0 Then
        siteIndex = i
        Exit For
    End If
Next
prevIndex = (siteIndex - 1 + UBound(sites) + 1) Mod (UBound(sites) + 1)
prevSlug = Split(sites(prevIndex), "slug'")(1)
prevSlug = Left(prevSlug, Len(prevSlug) - 1)
Response.Redirect("prev.asp?slug=" & prevSlug)
%>
