**Course Project**

Use this:
**Ruby**: Ruby, Ruby on Rails

You can use any database and any other libraries, components or even frameworks (but not replace specified above).

There are no limitations in the architecture or used services (you don't even have to separate front and back; it's not a recommendation, but you may go this way). Also, you may replace Bootstrap with any CSS framework and/or UI library you like. 

You have to implement a Web-application for personal collection management (books, post-stamps, coins, etc. — in the text below these are called items).

Non-authenticated users have read-only access (they can use search, but can’t create collections and items, can’t leave comments and likes).
Authenticated not-admins have access to everything except admin-page.
Admin-page allow user management — view; block; unblock; delete; add to admins; remove from admins. ADMIN IS ABLE TO REMOVE ADMIN ACCESS FROM ITSELF, it’s important.
Admin see all pages as their author (for example, admin can open collection of other user and add an item it it; so, admin is virtually owner of every collection and every item).
Only admin or creator of the collections or items can manage them (edit; add; delete). Everything is accessible for viewing for everyone (except admin page).
Users can register and authenticate via site forms.
Every pages (in the top header) provides an access to the full-text search. Search results are always items (e.g. if text is found in comment text, search result have to display link to the item with comments, not to the comment itself). If result is a collection you can either display any item or generate link to the collection.
Every user has its personal page where they can mange list of collections (create new, delete, or edit) — each collection in the list is a link to the collection page that contains table of items with sorting/filtering and capabilities to create new item, edit or delete existing item).
When item is opened for view (by author or another user) there are comments list at the bottom. Comments are linear, added to the end (it’s impossible to insert comment to previous comment). Comments have to be updated automatically — when item page is opened and somebody add a comment to it, it should be inserted (it’s possible to have a 2-5 second delay).
Every item also can have likes (no more than one from one user per given item).
Site should support two languages: English and any other — Polish, Uzbek, Georgian (user select one and the choice is saved). Site should support two visual themes (skins): light and dark (user select one and the choice is saved).
It’s required:
* to use CSS-framework, e.g. Bootstrap (but you can use any CSS-framework);
* to support different screen resolutions (including mobile phones), adaptive;
* to use ORM to access data (sequelize, prism, typeorm, anything you like), 
* to use full-text search engine (either external library or using native database features) — use can’t perform full database scan with SELECTs.

Every collection contains: name, description (with markdown formatting support), topic/category (one value from the predefined list, for example, “Books”, “Signs”, “Silverware”, and, of course, “Other”), optional image (uploaded by the users into the cloud).
Also collection allows to specified fields which every item in this collection will have. There are fixed fields: id, name, tags. And on the collection level user can select several of the following: 3 integer fields, 3 string fields, 3 multiline text fields, 3 Boolean checkboxes, 3 date fields). For all selected custom fields user specifies its name. 
For example, I want to store a book collection. I can select (add to standard set of id + name + tags) additional string field “Author”, additional text field “Synopsis”, addition data field “Publication Year”. All fields should be rendered on the item page as well as on the collection page in the list of items (OK, not all of them, let’s say strings and dates).
All items have tags (user can enter several tags; it’s necessary to support autocompletion — when user starts text entering, you have to display dropdown with tags starting with entered letter already stored in database).
Main page contains:
* list of latest items (name, collection, author);
* list of the top 5 largest collections;
* tag cloud (when the user clicks on the tag you display the list of items — in general you should use “search results page” for it).

**It is possible to use the X library? Yes, yes to all, remember my choice.**
Optional requirements (for a separate grade, only if all other requirements are implemented):
* authentication via social networks;
* add custom fields with the type “one from the given list” with ability to specify list of available options;
* add any number of custom fields of any kind (not 0 or 1 or 2 or 3 of integer fields, etc., but any number of them).
* add export collections to CSV-file.

IMPORTANT NOTE: do not copy any code from code heaps. IT’S MUCH BETTER TO DO LESS, BUT UNDERSTAND COMPLETELY WHAT DID YOU WRITE EXACTLY. I’m dead serious — we will ask you mo modify your code on the fly, add something or change something, will ask you questions and will check your ability to work with your project code. It’s more important than number of implemented requirements. Your supervisor saw a lot of similar projects and know probably most of the available sh..t on this topic in Internet. Do not copy. Use libraries as much as possible. But don’t copy. 
You have to use ready components, libraries, controls. E.g. use ready-to-use control to render markdown or ready-to-use control to upload images with drag-n-drop or ready-to-use control to enter tags or ready-to-use control to render tag cloud, etc.

AND THE MOST IMPORTANT: Start your work from deployment of static Hello, world page and **have a deployable version all the time**.

***AND EVEN MORE IMPORTANT: Defend your project even if you've done a small part of it.***
Please, don't forget that you'll get an additional reqs later (like in real life). You'll be asked to implement two integrations of your project with the 3rd-party applications/services. Try not to implement some kind of "store" or "blog" — the requirements are pretty specific about the functionality.

On the collection level, user can specify what fields can be used when creating or updating items. For example, user can create collection "Books" and decide that he/she wants to have an "Author" field in books. So, the user specify that there is a string field "Author" in the collection "Books".

So, items in this collection will have the following fields:
* Id (auto, non-editable)
* Name
* Tags
* Author
**Don't overcomplicate. Don't invent two linked databases SQL + NoSQL, don't change database scheme on-the-fly, etc.**

For basic requirements without optional ones (remember, you need to make it work firstm and only after that you may add  some fancy stuff) use the simplest possible approac. Each collection has the following attributes (and possibly other):
```
id
name
description
image_url
user_id
category_id
custom_string1_state
custom_string1_name
custom_string2_state
custom_string2_name
custom_string3_state
custom_string3_name
custom_int1_state
custom_int1_name
custom_int2_state
custom_int2_name
custom_int3_state
custom_int3_name
... etc. ...
```
So, if user defines a single custom string field with the name „Author”, you set `[custom_string1_state]` to `TRUE` and
`[custom_string1_name]` to `"Author"`.

You can use `NULL` value in the `*_name` fields to designate undefined custom fields, but you get the idea, I hope. The variant above is more flexible, e.g. `*_state` fields can store more then two variants, e.g. NOT_PRESENT,  PRESENT_OPTIONAL, PRESENT_REQUIRED, etc., in the simplest implementation these are booleans, field is shown or hidden).