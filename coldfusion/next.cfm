<cfparam name="url.index" default="1">
<cfif url.index eq arrayLen(sites)>
    <cfset nextIndex = 1>
<cfelse>
    <cfset nextIndex = url.index + 1>
</cfif>
<cflocation url="#sites[nextIndex].url#">
