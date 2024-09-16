require "helper"
require "inspec/resources/json"
require "inspec-mongodb-resources/resources/mongodb_conf"

describe "Inspec::Resources::MongodbConf" do
  let(:inspec_mock) { mock("inspec") }
  let(:mongo_mock) { mock("mongodb") } # Mock MongoDB client

  let(:conf_path) { File.join(Dir.pwd, "test/unit/fixtures/mongod.conf") }
  let(:mock_file) { mock("file") }

  before do
    # Mock file behavior
    mock_file.stubs(:file?).returns(true) # Stub the file? method to return true
    mock_file.stubs(:content).returns(File.read(conf_path)) # Stub the content method to return the content of the file

    inspec_mock.stubs(:file).with(conf_path).returns(mock_file) # Stub the inspec.file method to return the mock file object

    # Mock the inspec.mongodb.conf_path to return the conf_path
    inspec_mock.stubs(:mongodb).returns(mock("mongodb").tap do |mongodb_mock|
      mongodb_mock.stubs(:conf_path).returns(conf_path)
    end)
    MongodbConf.any_instance.stubs(:inspec).returns(inspec_mock) # Stub the inspec methods to return the inspec_mock
  end

  it "verify mongod.conf config parsing" do
    resource = MongodbConf.new(conf_path)

    _(resource.resource_id).must_equal conf_path
    _(resource.params["storage"]["dbPath"]).must_equal "/var/lib/mongodb"
    _(resource.params["systemLog"]["path"]).must_equal "/var/log/mongodb/mongod.log"
    _(resource.params["net"]["port"]).must_equal 27017
  end

  it "verify mongod.conf config parsing use default configuration file location." do
    resource = MongodbConf.new

    _(resource.resource_id).must_equal conf_path
    _(resource.params["storage"]["dbPath"]).must_equal "/var/lib/mongodb"
    _(resource.params["systemLog"]["path"]).must_equal "/var/log/mongodb/mongod.log"
    _(resource.params["net"]["port"]).must_equal 27017
  end
end
