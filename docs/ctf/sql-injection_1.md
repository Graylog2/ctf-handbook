# SQL Injection - Intro
## WTF is SQL Injection

If you've never popped a shell on a remote box, we forgive you.  We love you and its ok.  This is a safe space. 

## Seriously, please explain it

Alright, you data-dodging, code-jockeying cyberpunks, time to jack in. We're gonna surf down the gnarliest wave in the silicon sea, the dangerous underbelly of our digital utopia - the SQL injection. This ain't no Y2K bug, kids. We're talking about a real ghost in the machine.

So, you've built yourself a sweet little database, as pristine as a fresh install of Windows '98. It hums along, handling queries like a pro, secure as a dial-up connection in a land of fiber optics. But, beware, my friends, for there are wolves in these woods.

Your app is running a simple login form. A harmless query, right?
SELECT * FROM Users WHERE Username='[username]' AND Password='[password]';

But then, in saunters our bad actor, as slick as Zero Cool on a fresh keyboard. Instead of a simple username, they slide in a sneaky little snippet: ' OR '1'='1.

Suddenly, your innocent query morphs into this monstrosity:
SELECT * FROM Users WHERE Username='' OR '1'='1' AND Password='[password]';

And now, the game is up. '1' is always '1', just as the Logfather always sees the world in regex. Your query spills its guts, returning every user, and our digital villain is logged in as the first user in the list, usually the admin. Your system's been pwned, dude. It's like leaving your backdoor wide open in the middle of DEF CON.

So, what's the game plan, hotshot? Simple - don't trust user input. Treat it like it's got the same cooties as a chain email from the early 2000s. Sanitize that stuff, use prepared statements, and keep your database locked down tighter than your embarrassing Myspace account.

In the end, we all want to be the Logfather of our data: unruffled, insightful, and always catching the bugs in the matrix. Just remember - the keyboard is mightier than the sword!

I mean, you said 'seriously' but I didn't take you seriously. 

> I reward those who follow instructions.  Spoilers ahead.

Find a tool that you can use to try SQL Injection.  If you are the kind of person that reads 'Choose your own Adventure' books from start to finish, try [this](https://chromewebstore.google.com/detail/hackbar/ginpbkfigcoaokgflihfhhmglmbchinc?pli=1) in chrome.  There are others for whatever flavour of browser you prefer to chew on.  They even have the same name. 

