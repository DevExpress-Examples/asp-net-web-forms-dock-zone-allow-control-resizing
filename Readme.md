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


