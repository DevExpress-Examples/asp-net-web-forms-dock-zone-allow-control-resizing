# Dock Zone for ASP.NET Web Forms - How to allow users to resize a control
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e5058/)**
<!-- run online end -->

This example demonstrates how to change the control's height and width in the mouse move event handler to allow users to resize the control.

## Overview

Call the control's client-side [SetWidth](https://docs.devexpress.com/AspNet/js-ASPxClientControl.SetWidth(width)) and [SetHaight](https://docs.devexpress.com/AspNet/js-ASPxClientControl.SetHeight(height)) methods in the mouse move event handler to allow users to resize the control.

The example supports both postponed (when the control's frame is rendered and resized on mouse move, and the control is actually resized after the mouse button is released) and real time resizing (when the control is resized on mouse move). Set the 'postpone' JavaScript variable to 'false' to allow real time resizing.</p>

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
