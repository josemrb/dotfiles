-- local
local lspconfig = require("lspconfig")

local set_buffer_keymap = _G.set_buffer_keymap

local on_attach = function(client, bufnr)
  -- completion triggered by <C-x><C-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  set_buffer_keymap {bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>"}
  set_buffer_keymap {bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>"}
  set_buffer_keymap {bufnr, "n", "gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>"}
  set_buffer_keymap {bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>"}
  set_buffer_keymap {bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>"}
  set_buffer_keymap {bufnr, "n", "gs", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>"}
  set_buffer_keymap {bufnr, "n", "gn", "<Cmd>LTListNotebooks<CR>"}
  set_buffer_keymap {bufnr, "n", "gci", "<Cmd>lua vim.lsp.buf.incoming_calls()<CR>"}
  set_buffer_keymap {bufnr, "n", "gco", "<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>"}
  set_buffer_keymap {bufnr, "n", "gl", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"}
  set_buffer_keymap {bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>"}
  set_buffer_keymap {bufnr, "n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>"}
  set_buffer_keymap {bufnr, "n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>"}
  set_buffer_keymap {bufnr, "n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>"}
  set_buffer_keymap {bufnr, "n", "<Leader>e",  "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"}
  set_buffer_keymap {bufnr, "n", "<Leader>d", "<Cmd>lua vim.diagnostic.setloclist()<CR>"}
  set_buffer_keymap {bufnr, "n", "<Leader>g", "<Cmd>lua vim.diagnostic.setqflist()<CR>"}
  set_buffer_keymap {bufnr, "n", "<Space>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>"}
  set_buffer_keymap {bufnr, "n", "<Space>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>"}
  set_buffer_keymap {bufnr, "n", "<Space>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>"}

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local updated_capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {"cssls", "html", "emmet_ls", "jsonls", "tailwindcss"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    on_attach = on_attach,
  }
end

-- elixirls
lspconfig.elixirls.setup {
  capabilities = updated_capabilities,
  cmd = {"/home/josemrb/profiles/elixir/elixir-ls/release/language_server.sh"},
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = on_attach,
}

-- sumneko_lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  capabilities = updated_capabilities,
  cmd = {"/home/josemrb/local/opt/lua-language-server/bin/lua-language-server"},
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = {"vim"},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- local
local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.xmllint,
  null_ls.builtins.formatting.trim_whitespace,
  null_ls.builtins.formatting.trim_newlines,
  null_ls.builtins.formatting.tidy,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.mix,
  null_ls.builtins.diagnostics.trail_space,
  null_ls.builtins.diagnostics.tidy,
  null_ls.builtins.diagnostics.luacheck,
  null_ls.builtins.diagnostics.credo,
}

null_ls.setup {sources = sources}
