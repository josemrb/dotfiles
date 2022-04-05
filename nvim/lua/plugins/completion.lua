--local
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")

local has_words_before = _G.has_words_before

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",
    }),
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-y>"] = cmp.config.disable,
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources {
    {name = "nvim_lsp"},
    -- {name = "nvim_lsp_signature_help"},
    {name = "luasnip"},
    {name = "buffer", keyword_length = 5},
    {name = "path"},
    {name = "calc"},
    {name = "cmdline"},
  }
}
-- complete on search
cmp.setup.cmdline("/", {
  sources = {
  {name = "buffer"}
  }
})
-- complete command line
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
  {name = "path"}
  }, {
    {name = "cmdline"}
    })
})
