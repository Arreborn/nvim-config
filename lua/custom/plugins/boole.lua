return {
  'nat-418/boole.nvim',
  opts = {
    mappings = {
      increment = '<C-a>',
      decrement = '<C-x>',
    },
    additions = {
      { '[ ]', '[x]' },
    },
    allow_caps_additions = {
      { 'enable', 'disable' },
      { 'dev', 'prod' },
      { 'yes', 'no' },
      { 'må', 'ti', 'on', 'to', 'fr', 'lö', 'sö' },
      { 'mån', 'tis', 'ons', 'tor', 'fre', 'lör', 'sön' },
      { 'måndag', 'tisdag', 'onsdag', 'torsdag', 'fredag', 'lördag', 'söndag' },
    },
  },
}
