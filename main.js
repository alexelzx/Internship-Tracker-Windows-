const { app, BrowserWindow, shell } = require('electron');
const path = require('node:path');

function createWindow() {
  const window = new BrowserWindow({
    width: 1440,
    height: 940,
    minWidth: 960,
    minHeight: 680,
    backgroundColor: '#f8fafd',
    autoHideMenuBar: true,
    title: 'Stage — internship email tracker',
    webPreferences: {
      contextIsolation: true,
      nodeIntegration: false,
      spellcheck: true
    }
  });

  window.loadFile(path.join(__dirname, 'dist', 'index.html'));

  window.webContents.setWindowOpenHandler(({ url }) => {
    shell.openExternal(url);
    return { action: 'deny' };
  });
}

app.whenReady().then(() => {
  app.setAppUserModelId('com.stage.internship-tracker');
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});
