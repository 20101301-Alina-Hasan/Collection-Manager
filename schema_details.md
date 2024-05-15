Let us review each table and its attributes:

1. **collection:**
   - **collection_id:** Unique identifier for each collection.
   - **user_id:** ID of the user who owns the collection.
   - **category_id:** ID of the category to which the collection belongs.
   - **name:** Name of the collection.
   - **description:** Description of the collection.
   - **image_url:** URL of the image uploaded for the collection.

2. **custom_details:**
   - **collection_id:** Foreign key referencing the collection to which the custom details belong.
   - **int1_flag:** Flag indicating whether the first integer field is enabled for this collection.
   - **int1_name:** Name of the first integer field.
     
     **.**
     
     **.**
     
     **.**
         
   - **date3_flag:** Flag indicating whether the third date field is enabled for this collection.
   - **date3_name:** Name of the third date field.
   (Similar attributes for other custom fields)

3. **category:**
   - **category_id:** Unique identifier for each category.
   - **name:** Name of the category.

4. **item:**
   - **collection_id:** Foreign key referencing the collection to which the item belongs.
   - **item_id:** Unique identifier for each item within a collection.
   - **name:** Name of the item.
   - **int1**
        
     **.**
     
     **.**
     
     **.**
   
   - **date3**
   
   **int1, ... ,date3** are custom fields based on the flags in custom_details. Values are null if the corresponding flag is false.

5. **item_to_tag:**
   - **item_id:** Foreign key referencing the item associated with a tag.
   - **tag:** Tag associated with the item.

6. **tag:**
   - **tag_id:** Unique identifier for each tag.
   - **name:** Name of the tag.

7. **hearts:**
   - **user_id:** ID of the user who "hearted" the item.
   - **item_id:** ID of the item that was "hearted" by the user.

8. **users:**
   - **user_id:** Unique user ID, primary key.
   - **admin:** Flag indicating whether user is an admin.
   - **status:** Flag indicating whether user is active or blocked.
   - **username:** Unique username.
   - **name:** Cannot be null.
   - **email:** Unique email.
   - **password:** Hashed, not even admin can see.   

