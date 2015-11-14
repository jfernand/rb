module ui.frame;

import std.stdio;

import dlangui.core.logger;
import dlangui.platforms.common.platform;
import dlangui.widgets.appframe;
import dlangui.widgets.docks;
import dlangui.widgets.menu;
import dlangui.widgets.statusline;
import dlangui.widgets.tabs;
import dlangui.widgets.toolbars;
import dlangui.widgets.widget;

import ui.outputpanel;

class Frame : AppFrame {

    MenuItem mainMenuItems;
    //WorkspacePanel wsPanel;
    OutputPanel logPanel;
    DockHost dockHost;
    TabWidget tabs;

    this(Window window) {
        super();
        window.mainWidget = this;
        window.onFilesDropped = &onFilesDropped;
        window.onCanClose = &onCanClose;
        //window.onClose = &onWindowClose;
        //applySettings(_settings);
    }

    override protected Widget createBody() {
        //dockHost
    }

    override protected MainMenu createMainMenu() {

    }

    override protected StatusLine createStatusLine() {

    }

    override protected ToolBarHost createToolbars() {

    }
    /// handle files dropped to application window
    void onFilesDropped(string[] filenames) {
        Log.d("onFilesDropped(", filenames, ")");
    }

    /// return false to prevent closing
    bool onCanClose() {
        Log.d("onCanClose()");

        //askForUnsavedEdits(delegate() {
        //    window.close();
        //});
        return true;
    }
}