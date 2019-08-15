// Save the file to ~/.vim/coc-extensions
// Usage: xmap <silent> <TAB> <Plug>(coc-repl-sendvisualtext)
// Usage: nmap <silent> <TAB> <Plug>(coc-repl-sendnormaltext)
// Usage: imap <silent> <TAB> <c-o><Plug>(coc-repl-sendnormaltext)
const {commands, workspace} = require('coc.nvim')

function choose_exec(filetype) {
    let prog = ''
    if (filetype == 'javascript') {
        prog = 'node'
    } else if (filetype == 'typescript') {
        prog = 'ts-node'
    } else if (filetype == 'python') {
        prog = 'python'
    }
    return prog
}

exports.activate = context => {
    let {nvim} = workspace
    let terminal
    context.subscriptions.push(commands.registerCommand('repl.openTerminal', async () => {
        let filetype = await nvim.eval('&filetype')
        let prog = choose_exec(filetype)
        terminal = await workspace.createTerminal({
            name: prog || 'terminal',
            shellArgs: ['-c', prog],
        })
    }))
    context.subscriptions.push(commands.registerCommand('repl.showTerminal', async () => {
        if (terminal) {
            terminal.show()
        }
    }))
    context.subscriptions.push(commands.registerCommand('repl.disposeTerminal', async () => {
        if (terminal) {
            terminal.dispose()
        }
    }))
    context.subscriptions.push(workspace.registerKeymap(['n'], 'repl-sendnormaltext', async () => {
        await nvim.call('eval', 'feedkeys("\\<esc>", "in")')
        let doc = workspace.getDocument(workspace.bufnr)
        if (!doc) return
        let [, lineNumber, ,] = await nvim.call('getpos', '.')
        let text = doc.getline(lineNumber - 1)

        if (!terminal) {
            let filetype = await nvim.eval('&filetype')
            let prog = choose_exec(filetype)
            terminal = await workspace.createTerminal({
                name: prog || 'terminal',
                shellArgs: ['-c', prog],
            })
            terminal.show()
        }

        if (text && terminal) terminal.sendText(text, true)
    }, {sync: false, silent: true}))
    context.subscriptions.push(workspace.registerKeymap(['x'], 'repl-sendvisualtext', async () => {
        await nvim.call('eval', 'feedkeys("\\<esc>", "in")')
        let doc = workspace.getDocument(workspace.bufnr)
        if (!doc) return
        let visualmode = await nvim.call('visualmode')
        let range = await workspace.getSelectedRange(visualmode, doc)
        if (!range) return
        let text = doc.textDocument.getText(range)

        if (!terminal) {
            let filetype = await nvim.eval('&filetype')
            let prog = choose_exec(filetype)
            terminal = await workspace.createTerminal({
                name: prog || 'terminal',
                shellArgs: ['-c', prog],
            })
            terminal.show()
        }

        if (text && terminal) terminal.sendText(text, true)
    }, {sync: false, silent: true}))
}
