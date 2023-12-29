<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128554401/13.2.6%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E5058)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Dock Zone for ASP.NET Web Forms - How to allow users to resize a control

This example demonstrates how to change the control's height and width in the mouse move event handler to allow users to resize the control.

## Overview

Call the control's client-side [SetWidth](https://docs.devexpress.com/AspNet/js-ASPxClientControl.SetWidth(width)) and [SetHeight](https://docs.devexpress.com/AspNet/js-ASPxClientControl.SetHeight(height)) methods in the mouse move event handler to allow users to resize the control.

The example supports both postponed (when the control's frame is rendered and resized on mouse move, and the control is actually resized after the mouse button is released) and real time resizing (when the control is resized on mouse move). Set the 'postpone' JavaScript variable to 'false' to allow real time resizing.</p>

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
