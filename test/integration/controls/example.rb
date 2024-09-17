# NOTE: On CI/CD, we can possibly use the MongoDB Docker image to run this test or have some sort of mock for Mongo.
# TODO: Discuss with the team about the strategy to run integration tests for MongoDB (or other resource packs.)

control "mongodb_conf" do
  impact 1.0
  title "Verifies the configuration of MongoDB"
  desc "Verifies the configuration of MongoDB"

  describe mongodb_conf("/opt/homebrew/etc/mongod.conf") do
    its(%w{storage dbPath}) { should eq "/opt/homebrew/var/mongodb" }
    its(%w{net ipv6}) { should eq true }
  end
end

control "mongodb_session" do
  impact 1.0
  title "Verifies the session of MongoDB"
  desc "Verifies the session of MongoDB"
  describe mongodb_session(user: "adminUser", password: "adminPassword", database: "admin").query(rolesInfo: "dbAdmin").params["roles"].first do
    its(["role"]) { should eq "dbAdmin" }
  end
end
