<cfparam name="url.index" default="1">
<cfif url.index eq 1>
    <cfset prevIndex = arrayLen(sites)>
<cfelse>
    <cfset prevIndex = url.index - 1>
</cfif>
<cflocation url="#sites[prevIndex].url#">
