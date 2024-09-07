# SQL Injection - Part Deux
## How do I even?

Alright, all you cybernauts, fasten your seatbelts and put your keyboards in the upright position - we're about to take a deep dive into the notorious world of SQL injection. We're talking about the MariaDB backend, an HTTP post, URL encoding, a sprinkle of educated guessing, and the pièce de résistance: the UNION command.

Let's set the stage. You've got a web app - one of those relics from the early 2000s, coded by some caffeine-fueled developer who thought SQL injection was a medical condition. The app's got a MariaDB backend, and it's serving up data as eagerly as a golden retriever fetching a tennis ball.

For instance, you've got a URL like this: `http://example.com/products?catid=1000`. This harmless-looking URL is actually a goldmine for an attacker. It's passing the catid parameter directly into an SQL statement behind the scenes. Something like this:
```sql
SELECT * FROM Products WHERE catid = 1000;
```
Now, our intrepid hacker, armed with nothing but a keyboard and a solid understanding of SQL, decides to add a little something extra to that catid parameter, like `'` OR `'1'='1`. The resulting query?
```sql
SELECT * FROM Products WHERE catid = 1000 OR '1'='1';
```

If you're looking at the tool that we mentioned previously, which Of course you are, because you didn't just skim this document hunting for clues and now you're reading backwards from screenshots you don't recognize, then you would see something that looks like this. 

![Screenshot](./images/hackbar.png.png)

And boom! Just like that, the entire product catalogue is laid bare. But our hacker wants more. They want to see what other databases are hiding in the shadows. So, they might try injecting a command to list databases.  I'll save you the hassle of learning this database.
```sql
UNION SELECT schema_name, 2, 3 FROM information_schema.schemata --
```
This will look for the tables using a clever trick, and add it to the output of your super hardcore SQL injected payment page.  Now, it's a guessing game. `'users'`, `'customers'`, `'members'` - common names for databases holding juicy information.

But here's where the magic happens. The `UNION` command is the Swiss Army knife of SQL injection. It allows our hacker to combine the results of their injected query with the results of the original query. But there's a catch: the number of columns in the UNIONed query has to match the original.

If our original query was fetching three columns of data, our injection needs to request three columns too. Any more or less, and it'll spit out errors like a broken vending machine.

So, let's say our hacker knows there's a `'users'` database and it contains `'firstname'`, `'email'`, and `'password'` columns. They could craft an injection like this: 
```sql
catid=1000 UNION SELECT firstname, email, lastname FROM users LIMIT 7, 100
```
In URL encoding, because you live life on hardcore mode and you're injecting by URL - which means you probably aren't reading this tutorial but the above statement would look like this: 
##### THERE DO BE ANSWERS HERE
```
catid=1000%20UNION%20SELECT%20firstname%2C%20email%2C%20lastname%20FROM%20users%20LIMIT%207%2C%20100
```
This pulls the first name, email, and last name from the users database, starting from the 7th entry and for the next 100 entries. And just like that, our hacker has scored a treasure trove of data.  I wonder, I really really wonder, if there are any other columns that could be useful.  The Logfather would know...

Remember, my friends, with great power comes great responsibility. SQL injections are a potent tool in the wrong hands. As cyber warriors, it's our job to defend against such threats. So, keep your wits about you, sanitize your inputs, and keep your apps secure. The future of the digital realm depends on it.