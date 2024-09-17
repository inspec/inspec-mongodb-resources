require "helper"
require "inspec-mongodb-resources/resources/mongodb"

describe "Inspec::Resources::Mongodb" do
  let(:inspec_mock) { mock("inspec") }
  let(:os_mock) { { family: "windows" } }

  before do
    # Mock the inspec.os method
    inspec_mock.stubs(:os).returns(os_mock)
  end

  it "sets default configuration path on Windows" do
    # Mock the inspec.command method for Windows
    inspec_mock.stubs(:command).with("Get-ChildItem -Path \"C:\\Program Files\\MongoDB\\Server\" -Name").returns(mock(stdout: "4.4"))

    Mongodb.any_instance.stubs(:inspec).returns(inspec_mock)
    mongodb_resource = Mongodb.new
    _(mongodb_resource.conf_path).must_equal "C:\\Program Files\\MongoDB\\Server\\4.4\\bin\\mongod.cfg"
    _(mongodb_resource.resource_id).must_equal "C:\\Program Files\\MongoDB\\Server\\4.4\\bin\\mongod.cfg"
  end

  it "sets default configuration path on Linux" do
    # For Linux, change the OS family and no need to mock inspec.command
    os_mock[:family] = "debian"
    Mongodb.any_instance.stubs(:inspec).returns(inspec_mock)

    mongodb_resource = Mongodb.new
    _(mongodb_resource.conf_path).must_equal "/etc/mongod.conf"
    _(mongodb_resource.resource_id).must_equal "/etc/mongod.conf"
  end
end
