# InSpec Mongodb Resource Pack Profile

This example demonstrates how to use InSpec's MongoDB resource packs.

Follow the setup instructions below to get MongoDB up and running on macOS.

1. **Add the MongoDB Homebrew Tap**

    To download the official Homebrew formula for MongoDB and Database Tools, run the following command in your macOS Terminal:



    ```
    brew tap mongodb/brew
    ```

    Skip this step if you’ve already added the MongoDB tap previously.

2. **Update Homebrew and Existing Formulae**

    Run this command to update Homebrew and all installed formulae:

    ```
    brew update
    ```

3. **Install MongoDB**

    ```
    brew install mongodb-community@7.0
    ```

4. **Start MongoDB (i.e. the mongod process) as a macOS service**

    ```
    brew services start mongodb-community@7.0
    ```
5. **Verify MongoDB is Running**
    ```
    brew services list
    ```
    ```
    ❯ sudo brew services list
      Name              Status  User File
      mongodb-community started root /Library/LaunchDaemons/homebrew.mxcl.mongodb-community.plist
    ```

    You should see the service mongodb-community listed as started.

6. **Create a basic user**

    To create a basic user in MongoDB, follow these steps:

    1. Launch the MongoDB Shell (mongosh):
        ```
        mongsh
        ```
        ```
         Current Mongosh Log ID:	66e0366d6f6bd6facaa1d137
         Connecting to:		mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.3.0
         Using MongoDB:		7.0.14
         Using Mongosh:		2.3.0

         For mongosh info see: https://www.mongodb.com/docs/mongodb-shell/

         ------
            The server generated these startup warnings when booting
            2024-09-10T17:36:18.365+05:30: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
            2024-09-10T17:36:18.365+05:30: You are running this process as the root user, which is not recommended
         ------

         Warning: Found ~/.mongorc.js, but not ~/.mongoshrc.js. ~/.mongorc.js will not be loaded.
           You may want to copy or rename ~/.mongorc.js to ~/.mongoshrc.js.
         test>
        ```

      2. Switch to the admin database and create a user with the following commands:

           ```
            use admin
            db.createUser({
              user: "adminUser",
              pwd: "adminPassword", // Replace this with a secure password
              roles: [{ role: "userAdminAnyDatabase", db: "admin" }]
            })

           ```
For more detailed installation and setup documentation, visit: https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/
