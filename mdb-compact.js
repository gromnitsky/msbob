// On 64bit w10 1909 may require
// Microsoft Access Database Engine 2010 Redistributable
//
// Must be run using a 32bit WSH version: $WINDIR/SysWOW64/cscript

var jet = WScript.CreateObject('JRO.JetEngine')
var fs = new ActiveXObject('Scripting.FileSystemObject')

if (WScript.Arguments.length !== 2) err('Usage: mdb-compact.js old.mdb new.mdb')

var spec = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
try {
    jet.CompactDatabase(spec+WScript.Arguments(0), spec+WScript.Arguments(1))
} catch(e) {
    err(e.message)
}

function err(msg) {
    WScript.StdErr.WriteLine(fs.GetFile(WScript.ScriptFullName).Name
                             + ' error: '+ msg)
    WScript.Quit(1)
}
