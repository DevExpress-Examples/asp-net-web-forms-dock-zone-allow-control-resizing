<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDocking" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxDockZone - How to allow end-users to resize a control</title>
    <style>
        .draggingContainer {
            position: relative;
        }
        
        .horDragLine {
            position: absolute;
            top: 0;
            right: 0;
            width: 4px;
            cursor: e-resize;
        }
        
        .vertDragLine, .sizeGrip {
            position: absolute;
            bottom: 0;
        }
        
        .vertDragLine {
            width: 100%;
            height: 4px;
            cursor: s-resize;
        }
        
        .sizeGrip {
            right: 0;
            width: 12px;
            height: 12px;
            background: url("Default.aspx/DXR.axd?r=1_50-Aws08") no-repeat -18px -42px;
            cursor: se-resize;
        }
        
        .ResizeRect {
            position: absolute;
            border: 1px solid #808080;
        }
    </style>
    <script type="text/javascript">
        var startPoint = { x: 0, y: 0 };
        var initialSize = { width: 0, height: 0 };

        var postpone = true;

        function GetResizeRect(zone) {
            if(!postpone) return;
            var id = zone.name + "ResizeRect";
            var element = document.getElementById(id);
            if(!element) {
                element = document.createElement("DIV");
                element.id = id;
                element.className = "ResizeRect";
                element.style.display = "none";
                document.body.appendChild(element);
            }
            return element;
        }

        function dragHelper_OnMouseDown(event) {
            var src = ASPxClientUtils.GetEventSource(event);
            var vertDir = src.className === "vertDragLine";
            var horDir = src.className === "horDragLine";
            var bothDir = src.className === "sizeGrip";
            if(!vertDir && !bothDir && !horDir)
                return;

            startPoint.x = ASPxClientUtils.GetEventX(event);
            startPoint.y = ASPxClientUtils.GetEventY(event);
            initialSize.width = zone.GetWidth();
            initialSize.height = zone.GetHeight();

            var rectElement = GetResizeRect(zone);
            if(rectElement) {
                var zoneMainElement = zone.GetMainElement();

                rectElement.style.left = ASPxClientUtils.GetAbsoluteX(zoneMainElement) - 1 + "px";
                rectElement.style.top = ASPxClientUtils.GetAbsoluteY(zoneMainElement) - 1 + "px";
                rectElement.style.width = initialSize.width + "px";
                rectElement.style.height = initialSize.height + "px";

                rectElement.style.display = "";
            }

            var mouseMoveHandler = function (ev) {
                ASPxClientUtils.ClearSelection();
                ResizeGrid(ASPxClientUtils.GetEventX(ev), ASPxClientUtils.GetEventY(ev), vertDir, horDir, bothDir, GetResizeRect(zone));
            };
            var mouseUpHandler = function (evt) {
                ResizeGrid(ASPxClientUtils.GetEventX(evt), ASPxClientUtils.GetEventY(evt), vertDir, horDir, bothDir);
                var rectElement = GetResizeRect(zone);
                if(rectElement)
                    rectElement.style.display = "none";

                ASPxClientUtils.DetachEventFromElement(document, "mousemove", mouseMoveHandler);
                ASPxClientUtils.DetachEventFromElement(document, "mouseup", mouseUpHandler);
            };
            ASPxClientUtils.AttachEventToElement(document, "mousemove", mouseMoveHandler);
            ASPxClientUtils.AttachEventToElement(document, "mouseup", mouseUpHandler);
        }

        function ResizeGrid(x, y, vertDir, horDir, bothDir, rectElement) {
            var deltaX = x - startPoint.x;
            var deltaY = y - startPoint.y;
            var width = initialSize.width + deltaX;
            var height = initialSize.height + deltaY;

            if(horDir || bothDir) {
                if(rectElement)
                    rectElement.style.width = width + "px";
                else
                    zone.SetWidth(width);
                SetDraggingContainerWidth(width);
            }
            if(vertDir || bothDir) {
                if(rectElement)
                    rectElement.style.height = height + "px";
                else
                    zone.SetHeight(height);
                SetDraggingContainerHeight(height);
            }
        }

        var line;
        var container;
        function zn1_Init(s, e) {
            container = document.getElementById("container1");
            line = document.getElementById("horLine1");
            height = s.GetHeight();
            SetDraggingContainerSize(s.GetWidth(), height);
            SetHowDragLiheHeight(height);
        }

        function SetDraggingContainerSize(width, height) {
            if(!container) return;
            container.style.height = height + "px";
            container.style.width = width + "px";
            SetHowDragLiheHeight(height);
        }

        function SetDraggingContainerWidth(width) {
            if(!container) return;
            container.style.width = width + "px";
        }

        function SetDraggingContainerHeight(height) {
            if(!container) return;
            container.style.height = height + "px";
            SetHowDragLiheHeight(height);
        }

        function SetHowDragLiheHeight(height) {
            if(!container) return;
            line.style.height = height + "px";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxDockPanel runat="server" ID="panel1" PanelUID="panel1" VisibleIndex="0" ShowHeader="true"
        ShowCloseButton="false" AllowResize="true" OwnerZoneUID="zn1">
    </dx:ASPxDockPanel>
    <div id="container1" class="draggingContainer" onmousedown="dragHelper_OnMouseDown(event)">
        <dx:ASPxDockZone runat="server" ID="zn1" ZoneUID="zn1" Width="288px" Height="288"
            ClientInstanceName="zone" BackColor="LightGreen">
            <ClientSideEvents Init="zn1_Init" />
        </dx:ASPxDockZone>
        <div class="vertDragLine">
        </div>
        <div id="horLine1" class="horDragLine">
        </div>
        <div class="sizeGrip">
        </div>
    </div>
    </form>
</body>
</html>
