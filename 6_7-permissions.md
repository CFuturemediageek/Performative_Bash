The brain fog from permissions can get quite rough when you are first learning Linux.


I mean it's either accessible....or not right? How come in Windows I can just flick toggles or check boxes. ( They actually have a similar system as well! )


Well we are quickly diving into Unix perms. 


So with that being said, we will break down where permissions came from - crumple that up and throw it over our shoulder for later..and then get right into the meat. 


Permissions allow us to do stuff. That's it. But with the mention that it isn't always a green light or red light situation. 

Unix is a standard - and most GNU/linux based operating systems today adhere to that standard.
Being that the programs stored / directories / files on your system all have permissions they abide by, here are some doors that get passed through. The first door and the door that matters. Base UNIX Permissions. 


------------ Base Permissions ------------

The unholy trinity comes in two sets - and you have probably seen this in many how tos prior to reading this. If you're still stumped stay with me. I say this because as simple as this is it's quite easy to get a little wobbly with it, and can get messy - which we will cover so you can be a god. 


- ( r ) Read 4 

- ( w ) Write 2 

- ( x ) Execute 1

  ----------------------------------------
  
🍰 UNDERSTANDING LINUX FILE PERMISSIONS THROUGH A CAKE‑BAKING STORY





Imagine a mother baking a cake with their children. One of the children did not end up doing their homework and in this case OPE!....Mom says can't join in on the fun! Bummer! - Note that, the mother did not say they are NOT allowed to have any desert. ( This is important ) 

So these guys are in the kitchen baking - and I mean, the one kid...are..they allowed to just watch? I mean well sure (r(read-ing)) sounds like torture..but they can't help stare at the potential cake you guys are baking. But it's not like the child can do anything about it. Those are the permissions that the mother had set. Watching is the next best thing if youre up for it and don't want to be in your room ~

Feeling bad, the mom eventually gives in and says " Okay come on you can help us out ". 
That there! There is a glimmer of shine now, that they may actually get a chance to have some. A bite is in their court so theyre pretty happy. They get to mix the batter - help their siblings with the frosting etc.

We can call this a write. They get to mix, add certain amounts of sugar etc. Baking..*Sigh!* theyre baking!!....no-NO...Writing!...See what I did there. 

Oven....are they allowed to touch that? Probably not - and why? Well this is what actually forms the cake / Heats up and is a process that just starts and finishes/operates on it's own, takes our thing and turns it into something we can eat and they are explicitly not able to touch this. 

Now eating? Well now anyone might be able to eat - that is just the end result - The operations for the baking process did not determine if you got to indulge or not. In the end, the focus was on if you watched / helped bake / Started the oven. As anyone you may be satisfied whether you just chilled and watched ( Maybe youre on a vegan diet ), just helped to bake, or got to lay back and watch then JUST eat the cake. No matter how you slice it - it ends up being some combination of this and you MAY or MAY not have been satisfied with the process. 


What if they just got to help mix and ( W ) nothing else - how would they see??
I guess they would have to be blindfolded and hope for the best when adding the sugar wouldnt they? 

------------------------

In the UNIX sense, lets apply this to some files that you may have created. 



We can touch three files. 

touch file{1..3}.txt   

You should have the following when you ls in your current directory - file1.txt file2.txt file3.txt


When you set permissions on them youre going to want to use the chmod command followed by the permission set then the file name. 

In UNIX, each file has three groups of diners (or “participants”):

Owner – the person who created the file (the main baker).
Group – others in your kitchen crew.
Others – anyone else wandering by (the tasters).


Then each gets a combination of three permission types:

r – read (you get to “see” what’s in the file)

w – write (you get to “add ingredients” or even “change/affect the recipe”)


x – execute (you get to “operate the oven,” i.e., run the file if it’s a program)




Let’s say we want:

file1.txt
Owner: full control (7)
Group: read-only (4)
Others: no access (0)


chmod 740 file1.txt







OR 


- file3.txt

Owner: execute-only (1)
Group: execute-only (1)
Others: execute-only (1)
(Like giving everyone limited permission to turn on the oven… but they can’t see or change the recipe.)


chmod 111 file3.txt


