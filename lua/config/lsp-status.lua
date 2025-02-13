local lsp_status = require('lsp-status')

lsp_status.config({
  status_symbol = '',
  indicator_errors = 'ᛓ',
  indicator_warnings = 'ᚼ',
  indicator_info = 'ᛊ',
  indicator_hint = 'ᛘ',
  indicator_ok = '',
  indicator_separator = '',
})

lsp_status.register_progress()

