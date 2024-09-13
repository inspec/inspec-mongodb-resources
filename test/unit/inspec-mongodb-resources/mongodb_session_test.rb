require "helper"
require "inspec-mongodb-resources/resources/mongodb_session"

describe "Inspec::Resources::MongodbSession" do

  let(:client_mock) { mock("mongo_client") } # Mock MongoDB client
  let(:collection_mock) { mock("mongo_collection") } # Mock MongoDB collection (query result)

  before do
    # Mock the MongoDB client behavior
    Mongo::Client.stubs(:new).returns(client_mock) # Stub the creation of MongoDB client
    client_mock.stubs(:command).returns(collection_mock) # Stub MongoDB command response
    collection_mock.stubs(:documents).returns([{ "users" => [{ "roles" => [{ "role" => "readWrite" }] }] }]) # Stub the documents returned
  end

  it "fails when no user, password" do
    # Expecting the MongodbSession to raise an error due to missing authentication
    err = assert_raises(Inspec::Exceptions::ResourceFailed) do
      MongodbSession.new(host: "localhost", port: 27017, database: "test")
    end
    _(err.message).must_equal "Can't run MongoDB command. Error: Can't run MongoDB checks without authentication."
  end

  it "fails when no database name is provided" do
    # Expecting the MongodbSession to raise an error due to missing authentication
    err = assert_raises(Inspec::Exceptions::ResourceFailed) do
      MongodbSession.new(user: "foo", password: "bar", host: "localhost", port: 27017)
    end
    _(err.message).must_equal "Can't run MongoDB command. Error: You must provide a database name for the session."
  end

  it "queries the database and returns the correct role" do
    # Create the MongodbSession object
    resource = MongodbSession.new(user: "foo", password: "bar", host: "localhost", database: "test")

    # Perform the query
    result = resource.query(usersInfo: "ian")

    # Verify the query results
    _(result.params["users"].first["roles"].first["role"]).must_equal "readWrite"
  end

  it "creates a MongoDB session without errors" do
    # Create the MongodbSession object
    resource = MongodbSession.new(user: "foo", password: "bar", host: "localhost", database: "test")

    # Verify that the resource_id is correctly set
    _(resource.resource_id).must_equal "mongodb_session:User:foo:Host:localhost:Database:test"
  end
end
