# My Emacs Stuff (ironically I'm writing this readme in Vim)
My .emacs file and elisp stuff that I've written or stolen from the Internet.
Half this stuff I stole and all of it is trivial, so do whatever you like with it. I won't impose any kind of license on it.

my-editing.el contains functions for editing text. Some of them don't work because of the lameness of my elisp knowledge.

font-toggle.el contains functions taken from Xah Lee's Ergo Emacs page that let you globally change the font, like you can do in JEdit or Microsoft Word. You set up your own font list (mine is in the file) and then bind the cycle-font functions to some keystrokes (mine are <f5> and <f6>, as you can see in init.el). You can also set up the font list to have different fonts depending on what OS you're on. Since I don't own a Mac, I didn't bother to set up for it, but Xah's page (url in the file) tells you how.

html-entities.el contains functions that convert between HTML entity names (auml, for example) and Unicode characters (ä, for example). It includes html-ent-alist, an attribute list that maps between the two. Feel free to take just that file and use just that list, if you'd like to write your own functions. Mine are just simple applications of replace-string.
