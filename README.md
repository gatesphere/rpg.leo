rpg.leo
=======

A Leo worksheet with tools for running a tabletop RPG

Overview
--------
rpg.leo is a worksheet for use with the [Leo editor](http://webpages.charter.net/edreamleo/front.html) with helpful features for running a tabletop RPG.

Functionality
-------------
The `Startup` node contains all of the features of this worksheet.  Included are a some function definitions, button definitions, and minibuffer commands.  These are described below.

Function definitions
--------------------
The node `Startup -> Scripts -> @common code` contains the following function definitions:

### rpg_find_by_tag(tag)
This function, when called, uses the Nav pane to search for #tag.  For example, to search for nodes with the tag "#npc", call `rpg_find_by_tag('npc')`.

### rpg_roll_dice(dstring)
This function, when called, outputs the results of rolling some dice (defined by `dstring`, a common die-notation string such as `3d6+4`) to a pane called Dice.

Using the functions
-------------------
To use the functions included in `@common code`, you need to add this line to the top of any script in which they are to be used:

    exec(g.findTestScript(c,'@common code'))

That will find and load the script, ensuring that the functions are in scope and able to be used.

Button definitions
------------------
There are several buttons predefined in `Startup -> Buttons`.  To disable any of them, change their headline to include `@@button` instead of `@button`.

Command definitions
-------------------
TBD.

License
-------
Public domain.  Go wild.

