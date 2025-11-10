# Whacky Neovim config

This repo is my own personal Neovim config which I obsess over. Use it at your
own peril.

I'll try to keep a little changelog here. No promises how up-to-date it is.

## Changelog

- **250227**: Switched a lot of stuff over from Telescope to Snacks picker.
  Still a few plugins that require Telescope, so it stays for now. But most
  changes should work just as they used to, just faster and prettier.
- **250303**: Finally figured out some nice keybinds for `mini.surround`.
  Welcome back to the fold.
- **250303**: Mentioning folds triggered my obsession with trying to get folds
  working again. This might get deleted real quick if it still feels wonky. But
  for now, folding is back.
- **250311** Refactored a bit of color codes, essentially removing the need for
  a separate color import. Nice. Also some more stuff here I forgot.
- **250314** TELESCOPE IS DEAD. LONG LIVE SNACKS PICKER. Although, rip to Neogit
  due to that one. I can keep an eye out on
  [issue 1663](https://github.com/NeogitOrg/neogit/issues/1663) for when it's
  added, but honestly? I never touched the bastard. Some handy Git pickers are
  under the submenu `<leader>g`, such as diff view. Dunno what else Neogit can
  offer. Also scrapped Harpoon, because a) I never used it and b) it forces me
  to use Telescope. Many sad.
- **250318** I've done changes, but I don't know what? Mostly just purged
  plugins in my desperate quest for lower startup times. Send help.
- Works with Neovim 0.11 (on my machine). Added a highlight that broke with the
  update for some reason. No refactor to use the new LSP-config yet, that'll
  come _one day_.
- **250401** Not an april fools push. Could be though. However, since pretty
  much everything I write is in Markdown these days I've set up this fancy ass
  plugin that makes it look neater.
- **250403** Leap.nvim is dead, and Folke killed it. Tbh, I don't know why I
  didn't swap to Folkes magnificent stuff earlier.
- **250407** So, I never use Copilot. In fact, I have a line in my config
  explicitly disabling Copilot so that I can activate it when I need it, which
  is never. So I removed it.
- **250830** Dear diary, there's been an absurd amount of changes that my feeble
  mind cannot be arsed to list since last we spoke. Just know that stuff works.
- **251001** Some minor adjustments to LSP and docs. Major breaking change to
  open symbol documentation with ? (meaning that reverse searching is not
  standard, but Flash works well for that). Furthermore, S-Enter can now step
  out of parentheses / brackets and so on.
- **251110** Oh. Hi. Some minor refactoring, and one plugin that's taken an...
  Insteresting route. `sttusline` decided to re-write itself to a new plugin
  that is shite, and this version I'm on now has a feature that'll be removed in
  0.12. For now, I've taken to editing
  `$HOME/.local/share/nvim/lazy/sttusline/lua/sttusline/components/lsps-formatters.lua`
  and changing all instances of `vim.lsp.buf_get_clients()` to
  `vim.lsp.get_clients()` to remove a warning. Since `sttusline` won't be
  updated no more, this works for the moment.
