<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128554401/13.2.6%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E5058)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
<!-- default file list end -->
# ASPxDockZone - How to allow end-users to resize a control
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e5058/)**
<!-- run online end -->


<p>It's possible to allow end-users to resize the ASPxDockZone by changing the control's height and width in the mouse move event handler with the <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxClassesScriptsASPxClientControl_SetWidthtopic">ASPxClientDockZone.SetWidth</a> and <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxClassesScriptsASPxClientControl_SetHeighttopic">ASPxClientDockZone.SetHeight</a> methods.</p><br />
<p>The example supports both postponed (when the control's frame is rendered and resized on mouse move, and the control is actually resized after the mouse button is released) and real time resizing (when the control is resized on mouse move). Set the 'postpone' JavaScript variable to 'false' to allow real time resizing.</p>

<br/>


