module ui.commands;

public import dlangui.core.events;
import dlangui.widgets.editors;

enum IDEActions : int {
    FileNew = 1010000,
    FileNewWorkspace,
    FileNewProject,
    FileOpen,
    FileOpenWorkspace,
    FileSave,
    FileSaveAs,
    FileSaveAll,
    FileClose,
    FileExit,
    EditPreferences,
    ProjectConfigurations,
    BuildConfigurations,
    BuildWorkspace,
    RebuildWorkspace,
    CleanWorkspace,
    BuildProject,
    RebuildProject,
    CleanProject,
    RefreshProject,
    UpdateProjectDependencies,
    SetStartupProject,
    ProjectSettings,
    DebugStart,
    DebugStartNoDebug,
    DebugContinue,
    DebugStop,
    DebugPause,
    HelpAbout,
    WindowCloseAllDocuments,
    CreateNewWorkspace,
    AddToCurrentWorkspace,
    ProjectFolderAddItem,
    ProjectFolderRemoveItem,
    ProjectFolderOpenItem,
    ProjectFolderRenameItem,
    GoToDefinition,
    GetCompletionSuggestions,
    InsertCompletion,
    FindText,
}

__gshared static this() {
    // register editor action names and ids
    registerActionEnum!IDEActions();
}


const Action ACTION_PROJECT_FOLDER_ADD_ITEM = new Action(IDEActions.ProjectFolderAddItem, "MENU_PROJECT_FOLDER_ADD_ITEM"c);
const Action ACTION_PROJECT_FOLDER_OPEN_ITEM = new Action(IDEActions.ProjectFolderOpenItem, "MENU_PROJECT_FOLDER_OPEN_ITEM"c);
const Action ACTION_PROJECT_FOLDER_REMOVE_ITEM = new Action(IDEActions.ProjectFolderRemoveItem, "MENU_PROJECT_FOLDER_REMOVE_ITEM"c);
const Action ACTION_PROJECT_FOLDER_RENAME_ITEM = new Action(IDEActions.ProjectFolderRenameItem, "MENU_PROJECT_FOLDER_RENAME_ITEM"c);

const Action ACTION_FILE_NEW_SOURCE_FILE = new Action(IDEActions.FileNew, "MENU_FILE_NEW_SOURCE_FILE"c, "document-new", KeyCode.KEY_N, KeyFlag.Control);
const Action ACTION_FILE_NEW_PROJECT = new Action(IDEActions.FileNewProject, "MENU_FILE_NEW_PROJECT"c);
const Action ACTION_FILE_NEW_WORKSPACE = new Action(IDEActions.FileNewWorkspace, "MENU_FILE_NEW_WORKSPACE"c);
const Action ACTION_FILE_OPEN = new Action(IDEActions.FileOpen, "MENU_FILE_OPEN"c, "document-open", KeyCode.KEY_O, KeyFlag.Control);
const Action ACTION_FILE_OPEN_WORKSPACE = new Action(IDEActions.FileOpenWorkspace, "MENU_FILE_OPEN_WORKSPACE"c, null, KeyCode.KEY_O, KeyFlag.Control | KeyFlag.Shift);
const Action ACTION_FILE_SAVE = (new Action(IDEActions.FileSave, "MENU_FILE_SAVE"c, "document-save", KeyCode.KEY_S, KeyFlag.Control)).disableByDefault();
const Action ACTION_FILE_SAVE_AS = (new Action(IDEActions.FileSaveAs, "MENU_FILE_SAVE_AS"c)).disableByDefault();
const Action ACTION_FILE_SAVE_ALL = (new Action(IDEActions.FileSaveAll, "MENU_FILE_SAVE_ALL"c, null, KeyCode.KEY_S, KeyFlag.Control | KeyFlag.Shift)).disableByDefault();
const Action ACTION_FILE_EXIT = new Action(IDEActions.FileExit, "MENU_FILE_EXIT"c, "document-close"c, KeyCode.KEY_X, KeyFlag.Alt);
const Action ACTION_WORKSPACE_BUILD = new Action(IDEActions.BuildWorkspace, "MENU_BUILD_WORKSPACE_BUILD"c);
const Action ACTION_WORKSPACE_REBUILD = new Action(IDEActions.RebuildWorkspace, "MENU_BUILD_WORKSPACE_REBUILD"c);
const Action ACTION_WORKSPACE_CLEAN = new Action(IDEActions.CleanWorkspace, "MENU_BUILD_WORKSPACE_CLEAN"c);
const Action ACTION_PROJECT_CONFIGURATIONS = new Action(IDEActions.ProjectConfigurations, "MENU_PROJECT_CONFIGURATIONS"c);
const Action ACTION_BUILD_CONFIGURATIONS = new Action(IDEActions.BuildConfigurations, "MENU_BUILD_CONFIGURATIONS"c);
const Action ACTION_PROJECT_BUILD = new Action(IDEActions.BuildProject, "MENU_BUILD_PROJECT_BUILD"c, "run-build", KeyCode.F7, 0);
const Action ACTION_PROJECT_REBUILD = new Action(IDEActions.RebuildProject, "MENU_BUILD_PROJECT_REBUILD"c, "run-build-clean", KeyCode.F7, KeyFlag.Control);
const Action ACTION_PROJECT_CLEAN = new Action(IDEActions.CleanProject, "MENU_BUILD_PROJECT_CLEAN"c, null);
const Action ACTION_PROJECT_SET_STARTUP = new Action(IDEActions.SetStartupProject, "MENU_PROJECT_SET_AS_STARTUP"c, null);
const Action ACTION_PROJECT_SETTINGS = (new Action(IDEActions.ProjectSettings, "MENU_PROJECT_SETTINGS"c, null)).disableByDefault();
const Action ACTION_PROJECT_REFRESH = new Action(IDEActions.RefreshProject, "MENU_PROJECT_REFRESH"c);
const Action ACTION_PROJECT_UPDATE_DEPENDENCIES = new Action(IDEActions.UpdateProjectDependencies, "MENU_PROJECT_UPDATE_DEPENDENCIES"c);
const Action ACTION_DEBUG_START = new Action(IDEActions.DebugStart, "MENU_DEBUG_START_DEBUGGING"c, "debug-run"c, KeyCode.F5, 0);
const Action ACTION_DEBUG_START_NO_DEBUG = new Action(IDEActions.DebugStartNoDebug, "MENU_DEBUG_START_NO_DEBUGGING"c, null, KeyCode.F5, KeyFlag.Control);
const Action ACTION_DEBUG_CONTINUE = new Action(IDEActions.DebugContinue, "MENU_DEBUG_CONTINUE"c);
const Action ACTION_DEBUG_STOP = (new Action(IDEActions.DebugStop, "MENU_DEBUG_STOP"c)).disableByDefault();
const Action ACTION_DEBUG_PAUSE = (new Action(IDEActions.DebugPause, "MENU_DEBUG_PAUSE"c)).disableByDefault();
const Action ACTION_EDIT_COPY = (new Action(EditorActions.Copy, "MENU_EDIT_COPY"c, "edit-copy"c, KeyCode.KEY_C, KeyFlag.Control)).addAccelerator(KeyCode.INS, KeyFlag.Control).disableByDefault();
const Action ACTION_EDIT_PASTE = (new Action(EditorActions.Paste, "MENU_EDIT_PASTE"c, "edit-paste"c, KeyCode.KEY_V, KeyFlag.Control)).addAccelerator(KeyCode.INS, KeyFlag.Shift).disableByDefault();
const Action ACTION_EDIT_CUT = (new Action(EditorActions.Cut, "MENU_EDIT_CUT"c, "edit-cut"c, KeyCode.KEY_X, KeyFlag.Control)).addAccelerator(KeyCode.DEL, KeyFlag.Shift).disableByDefault();
const Action ACTION_EDIT_UNDO = (new Action(EditorActions.Undo, "MENU_EDIT_UNDO"c, "edit-undo"c, KeyCode.KEY_Z, KeyFlag.Control)).disableByDefault();
const Action ACTION_EDIT_REDO = (new Action(EditorActions.Redo, "MENU_EDIT_REDO"c, "edit-redo"c, KeyCode.KEY_Y, KeyFlag.Control)).addAccelerator(KeyCode.KEY_Z, KeyFlag.Control|KeyFlag.Shift).disableByDefault();
const Action ACTION_EDIT_INDENT = (new Action(EditorActions.Indent, "MENU_EDIT_INDENT"c, "edit-indent"c, KeyCode.TAB, 0)).addAccelerator(KeyCode.KEY_BRACKETCLOSE, KeyFlag.Control).disableByDefault();
const Action ACTION_EDIT_UNINDENT = (new Action(EditorActions.Unindent, "MENU_EDIT_UNINDENT"c, "edit-unindent", KeyCode.TAB, KeyFlag.Shift)).addAccelerator(KeyCode.KEY_BRACKETOPEN, KeyFlag.Control).disableByDefault();
const Action ACTION_EDIT_TOGGLE_LINE_COMMENT = (new Action(EditorActions.ToggleLineComment, "MENU_EDIT_TOGGLE_LINE_COMMENT"c, null, KeyCode.KEY_DIVIDE, KeyFlag.Control)).disableByDefault();
const Action ACTION_EDIT_TOGGLE_BLOCK_COMMENT = (new Action(EditorActions.ToggleBlockComment, "MENU_EDIT_TOGGLE_BLOCK_COMMENT"c, null, KeyCode.KEY_DIVIDE, KeyFlag.Control|KeyFlag.Shift)).disableByDefault();
const Action ACTION_EDIT_PREFERENCES = (new Action(IDEActions.EditPreferences, "MENU_EDIT_PREFERENCES"c, null)).disableByDefault();
const Action ACTION_HELP_ABOUT = new Action(IDEActions.HelpAbout, "MENU_HELP_ABOUT"c);
const Action ACTION_WINDOW_CLOSE_ALL_DOCUMENTS = new Action(IDEActions.WindowCloseAllDocuments, "MENU_WINDOW_CLOSE_ALL_DOCUMENTS"c);

const Action ACTION_CREATE_NEW_WORKSPACE = new Action(IDEActions.CreateNewWorkspace, "Create new workspace"d);
const Action ACTION_ADD_TO_CURRENT_WORKSPACE = new Action(IDEActions.AddToCurrentWorkspace, "Add to current workspace"d);

const Action ACTION_GO_TO_DEFINITION = (new Action(IDEActions.GoToDefinition,  "GO_TO_DEFINITION"c, ""c, KeyCode.KEY_G, KeyFlag.Control)).addAccelerator(KeyCode.F12, 0).disableByDefault();
const Action ACTION_GET_COMPLETIONS = (new Action(IDEActions.GetCompletionSuggestions,  "SHOW_COMPLETIONS"c, ""c, KeyCode.KEY_G, KeyFlag.Control|KeyFlag.Shift)).addAccelerator(KeyCode.SPACE, KeyFlag.Control).disableByDefault();
const Action ACTION_FIND_TEXT = (new Action(IDEActions.FindText,  "FIND_TEXT"c, "edit-find"c, KeyCode.KEY_F, KeyFlag.Control));
