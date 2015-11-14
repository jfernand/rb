module app;

import std.conv;
import dlangui;
import ui.frame;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {

	//Platform.instance.uiTheme = "theme_default";

    // create window
    Window window = Platform.instance.createWindow("Board Control", null);

    auto frame = new Frame(window);
    // create some widgets to show in window
 //   auto vLayout      = new VerticalLayout;
 //   auto btnLayout    = (new TableLayout).colCount = 8;

 //   auto buttons   = new Button[8];
 //   auto radioButtons = new RadioButton[8];

 //   foreach(int i, button; radioButtons) {
 //   	button = new RadioButton;
 //   	button.text(to!dstring(i + 1));
	//    btnLayout.addChild(button);
	//}

 //   foreach(int i, button; buttons) {
 //   	button = new Button;
 //   	button.text(to!dstring(i + 1));
	//    btnLayout.addChild(button);
	//}
	//vLayout.addChild(btnLayout);

 //   Button btnHello = new Button();
 //   btnHello.text("Hello, world!"d);

	//vLayout.addChild(btnHello);
 //   window.mainWidget = vLayout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
