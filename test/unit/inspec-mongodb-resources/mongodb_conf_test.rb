# require "helper"
# require "inspec/resources/json"
# require "inspec-mongodb-resources/resources/mongodb_conf"

# describe "Inspec::Resources::MongodbConf" do
#   it "verify mongd.conf config parsing" do
#     resource = MongodbConf.new("/etc/mongod.conf")
#     _(resource.resource_id).must_equal "/etc/mongod.conf"
#     _(resource.params["storage"]["dbPath"]).must_equal "/var/lib/mongodb"
#     _(resource.params["systemLog"]["path"]).must_equal "/var/log/mongodb/mongod.log"
#     _(resource.params["net"]["port"]).must_equal 27017
#   end

#   it "verify mongd.conf config parsing use default configuration file location." do
#     resource = MongodbConf.new
#     _(resource.params["storage"]["dbPath"]).must_equal "/var/lib/mongodb"
#     _(resource.params["systemLog"]["path"]).must_equal "/var/log/mongodb/mongod.log"
#   end
# end
