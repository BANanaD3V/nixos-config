''
/***
 *    ╔═╗╔═╗╔╦╗╔╗ ╦╔═╗  ╔╦╗╦ ╦╔═╗╔╦╗╔═╗	author: z0mbi3
 *    ╔═╝║ ║║║║╠╩╗║║╣    ║ ╠═╣║╣ ║║║║╣ 	url: https://github.com/gh0stzk/dotfiles
 *    ╚═╝╚═╝╩ ╩╚═╝╩╚═╝   ╩ ╩ ╩╚═╝╩ ╩╚═╝	z0mbi3 Fox Firefox Theme
 */

@import url("userChrome.css");
/* Removes white loading page */
@-moz-document url(about:blank), url(about:newtab), url(about:home) {
    html:not(#ublock0-epicker), html:not(#ublock0-epicker) body, #newtab-customize-overlay {
      background: var(--z0mbi3-bg) !important;
    }
  }
''
