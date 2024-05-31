<cfparam name="form.password" default="">
<cfparam name="form.new_password" default="">
<cfparam name="form.site_url" default="">

<cfif form.password eq "a3_!-9a">
    <cfif form.new_password neq "">
        <cfset password = form.new_password>
    </cfif>
    <cfif form.site_url neq "">
        <cfset arrayAppend(sites, {url=form.site_url, name=form.site_url})>
    </cfif>
  <hr> 
  <h1>Welcome to the admin panel!!</h1>
    <h2>addSite</h2>
    <form action="index.cfm" method="post">
        <label>Site URL:</label>
        <input type="text" name="site_url"><br>
        <input type="submit" value="add">
    </form>
    <hr>
    <h2>changePassWord</h2>
    <form action="index.cfm" method="post">
        <label>New password (please change it):</label>
        <input type="password" name="new_password"><br>
        <input type="submit" value="change pass">
    </form>
<cfelse>
    <h1>no</h1>
</cfif>
