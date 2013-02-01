<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo (http://webpages.charter.net/edreamleo/front.html) -->
<?xml-stylesheet ekr_test?>
<leo_file xmlns:leo="http://www.leo-editor.org/2011/leo" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="peckj.20130130110049.5559"><vh>Startup</vh>
<v t="peckj.20130130133524.1374"><vh>Buttons</vh>
<v t="peckj.20130130135139.1384"><vh>Tag-finding buttons</vh>
<v t="peckj.20130131083021.1418" a="E"><vh>Unused</vh>
<v t="peckj.20130130135455.1409"><vh>@@button pcs</vh></v>
<v t="peckj.20130130122926.1372"><vh>@@button npcs</vh></v>
<v t="peckj.20130130135455.1405"><vh>@@button locations</vh></v>
<v t="peckj.20130130135455.1407"><vh>@@button items</vh></v>
<v t="peckj.20130130135455.1406"><vh>@@button events</vh></v>
<v t="peckj.20130130135455.1408"><vh>@@button rules</vh></v>
</v>
<v t="peckj.20130201100641.14832"><vh>@button find</vh>
<v t="peckj.20130201100641.14821"><vh>@rclick pcs</vh></v>
<v t="peckj.20130201100641.14822"><vh>@rclick npcs</vh></v>
<v t="peckj.20130201100641.14823"><vh>@rclick locations</vh></v>
<v t="peckj.20130201100641.14824"><vh>@rclick items</vh></v>
<v t="peckj.20130201100641.14825"><vh>@rclick events</vh></v>
<v t="peckj.20130201100641.14826"><vh>@rclick rules</vh></v>
</v>
</v>
<v t="peckj.20130130135139.1385"><vh>Die-rolling buttons</vh>
<v t="peckj.20130131083021.1417"><vh>Unused</vh>
<v t="peckj.20130130160613.1417"><vh>@@button 1d20</vh></v>
<v t="peckj.20130130160613.1414"><vh>@@button 2df</vh></v>
<v t="peckj.20130131083021.1416"><vh>@@button 2d6</vh></v>
<v t="peckj.20130130135139.1386"><vh>@@button 3d6</vh></v>
<v t="peckj.20130130160613.1415"><vh>@@button 1df</vh></v>
</v>
<v t="peckj.20130130134116.1382"><vh>@button 4df</vh>
<v t="peckj.20130201100641.14999"><vh>@rclick 2df</vh></v>
<v t="peckj.20130201100641.14831"><vh>@rclick 1df</vh></v>
</v>
<v t="peckj.20130130160613.1418"><vh>@button 1d6</vh>
<v t="peckj.20130201100641.14997"><vh>@rclick 2d6</vh></v>
<v t="peckj.20130201100641.14829"><vh>@rclick 3d6</vh></v>
</v>
<v t="peckj.20130130160613.1416"><vh>@button 1d100</vh></v>
<v t="peckj.20130201100641.14995"><vh>@button roll-dice</vh>
<v t="peckj.20130201100641.14827"><vh>@rclick 1d100</vh></v>
<v t="peckj.20130201100641.15001"><vh>@rclick 1d20</vh></v>
<v t="peckj.20130201100641.14828"><vh>@rclick 1d6</vh></v>
<v t="peckj.20130201100641.14997"></v>
<v t="peckj.20130201100641.14829"></v>
<v t="peckj.20130201100641.14830"><vh>@rclick 4df</vh></v>
<v t="peckj.20130201100641.14999"></v>
<v t="peckj.20130201100641.14831"></v>
</v>
</v>
</v>
<v t="peckj.20130130133524.1373"><vh>Scripts</vh>
<v t="peckj.20130130110049.5563"><vh>@common code</vh></v>
</v>
</v>
<v t="peckj.20130130140936.1402"><vh>ScratchPad</vh></v>
<v t="peckj.20130130140936.1403"><vh>ScriptPad</vh></v>
<v t="peckj.20130130140936.1400"><vh>NPCs</vh>
<v t="peckj.20130130110049.5561"><vh>John Doe #npc</vh></v>
<v t="peckj.20130130110049.5562"><vh>Jane Smith #npc</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="peckj.20130130110049.5559">@ please see the Scripts node for more information
@c

@color
@language python
@tabwidth -2
</t>
<t tx="peckj.20130130110049.5561"></t>
<t tx="peckj.20130130110049.5562"></t>
<t tx="peckj.20130130110049.5563">## this script creates a few functions
## for later retrieval/use by buttons/minibuffer commands

## fn defns
def rpg_find_by_tag(tag):
  ''' finds nodes marked with a hashtag with the quicksearch
      plugin (nav tab)
  '''
  tag = '#' + tag
  c.frame.log.selectTab('Nav')
  nav = c.frame.log.widget
  nav.ui.lineEdit.setText(tag)
  nav.returnPressed()
  c.executeMinibufferCommand('focus-to-nav')

def rpg_roll_dice(dstring):
  ''' roll dice '''
  import random
  diestring = ("1d6" if not dstring else dstring)
  values = []
  diestring2 = diestring.replace("-", " -")
  diestring2 = diestring2.replace("+", " ")
  dice = diestring2.lower().split()
  for die in dice:
    if die.find('d') != -1:
      num = die[0:die.index('d')]
      num = (1 if num == '' else int(num))
      sides = int(die[die.index('d')+1:])
      for i in range(num):
        values.append(random.randrange(1, sides+1))
    else:
      values.append(int(die))
  c.frame.log.selectTab('Dice')
  g.es('%s %s Total: %d' % (diestring, values, sum(values)), color='blue', tabName='Dice')
</t>
<t tx="peckj.20130130122926.1372">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('npc')</t>
<t tx="peckj.20130130133524.1373">@ The node Startup -&gt; Scripts -&gt; @common code contains the following 
  function definitions:

  ## rpg_find_by_tag(tag)
  This function, when called, uses the Nav pane to search for #tag. 
  For example, to search for nodes with the tag "#npc", call 
  rpg_find_by_tag('npc').

  ## rpg_roll_dice(dstring)
  This function, when called, outputs the results of rolling some 
  dice (defined by dstring, a common die-notation string such as 
  3d6+4) to a pane called Dice.
  
  To use the functions included in @common code, you need to add 
  this line to the top of any script in which they are to be used:

  exec(g.findTestScript(c,'@common code'))
  
  That will find and load the script, ensuring that the functions 
  are in scope and able to be used.
@c</t>
<t tx="peckj.20130130133524.1374">@ To enable buttons, make sure they only have a single @ in their headlines.
  Likewise, to disable them, make sure their headline starts with @@.
@c</t>
<t tx="peckj.20130130134116.1382">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('4d3-8')
# equivalent to 4dF: 1dF is 1d3-2.

# A dF is a Fudge/Fate die, a six-sided die 
# marked with +,+,0,0,-,-.</t>
<t tx="peckj.20130130135139.1384"></t>
<t tx="peckj.20130130135139.1385"></t>
<t tx="peckj.20130130135139.1386">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('3d6')</t>
<t tx="peckj.20130130135455.1405">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('location')</t>
<t tx="peckj.20130130135455.1406">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('event')</t>
<t tx="peckj.20130130135455.1407">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('item')</t>
<t tx="peckj.20130130135455.1408">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('rule')</t>
<t tx="peckj.20130130135455.1409">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('pc')</t>
<t tx="peckj.20130130140936.1400"></t>
<t tx="peckj.20130130140936.1402">@ use this node as a scratch pad for quick notes or tracking ephemeral data
@c

</t>
<t tx="peckj.20130130140936.1403">@color
@language python
@tabwidth -2
## this line is required to use the functions provided by the script
exec(g.findTestScript(c,'@common code'))

## use this node to write quick scripts, such as complex dierolls
## run with Ctrl+B

## your code here
rpg_roll_dice("2d3-4+1d5-3")
</t>
<t tx="peckj.20130130160613.1414">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('2d3-4')
# equivalent to 2dF: 1dF is 1d3-2.

# A dF is a Fudge/Fate die, a six-sided die 
# marked with +,+,0,0,-,-.</t>
<t tx="peckj.20130130160613.1415">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('1d3-2')

# A dF is a Fudge/Fate die, a six-sided die 
# marked with +,+,0,0,-,-.</t>
<t tx="peckj.20130130160613.1416">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('1d100')
</t>
<t tx="peckj.20130130160613.1417">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('1d20')</t>
<t tx="peckj.20130130160613.1418">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('1d6')
</t>
<t tx="peckj.20130131083021.1416">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('2d6')</t>
<t tx="peckj.20130131083021.1417"></t>
<t tx="peckj.20130131083021.1418"></t>
<t tx="peckj.20130201100641.14821">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('pc')</t>
<t tx="peckj.20130201100641.14822">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('npc')</t>
<t tx="peckj.20130201100641.14823">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('location')</t>
<t tx="peckj.20130201100641.14824">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('item')</t>
<t tx="peckj.20130201100641.14825">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('event')</t>
<t tx="peckj.20130201100641.14826">exec(g.findTestScript(c,'@common code'))
rpg_find_by_tag('rule')</t>
<t tx="peckj.20130201100641.14827">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('1d100')
</t>
<t tx="peckj.20130201100641.14828">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('1d6')
</t>
<t tx="peckj.20130201100641.14829">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('3d6')</t>
<t tx="peckj.20130201100641.14830">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('4d3-8')
# equivalent to 4dF: 1dF is 1d3-2.

# A dF is a Fudge/Fate die, a six-sided die 
# marked with +,+,0,0,-,-.</t>
<t tx="peckj.20130201100641.14831">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('1d3-2')

# A dF is a Fudge/Fate die, a six-sided die 
# marked with +,+,0,0,-,-.</t>
<t tx="peckj.20130201100641.14832">g.es('Right click the button for options.')</t>
<t tx="peckj.20130201100641.14995">g.es('Right click the button for options.')</t>
<t tx="peckj.20130201100641.14997">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('2d6')</t>
<t tx="peckj.20130201100641.14999">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('2d3-4')
# equivalent to 2dF: 1dF is 1d3-2.

# A dF is a Fudge/Fate die, a six-sided die 
# marked with +,+,0,0,-,-.</t>
<t tx="peckj.20130201100641.15001">exec(g.findTestScript(c,'@common code'))
rpg_roll_dice('1d20')</t>
</tnodes>
</leo_file>
