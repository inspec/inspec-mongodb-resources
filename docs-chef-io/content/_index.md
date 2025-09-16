+++
title = "About the Chef InSpec MongoDB resource pack"
draft = false
linkTitle = "MongoDB resource pack"
summary = "Chef InSpec resources for auditing MongoDB databases and configurations."

[cascade]
  [cascade.params]
    platform = "mongodb"

[menu.mongodb]
  title = "About MongoDB resources"
  identifier = "inspec/resources/mongodb/about"
  parent = "inspec/resources/mongodb"
  weight = 10
+++

The Chef InSpec MongoDB resources allow you to audit MongoDB database configurations, user permissions, and security settings.

## Support

The InSpec MongoDB resources are supported in the following InSpec versions:

- InSpec 6 and earlier: MongoDB resources were included in the InSpec core installation
- InSpec 7 and later: MongoDB resources are distributed as the separate `inspec-mongodb-resources` gem

### Add to your InSpec profile

To add this resource pack to an InSpec profile, add the `inspec-mongodb-resources` gem as a dependency in your `inspec.yml` file:

```yaml
depends:
  - name: inspec-mongodb-resources
    gem: inspec-mongodb-resources
```

## MongoDB resources

{{< inspec_resources_filter >}}

The following Chef InSpec MongoDB resources are available in this resource pack.

{{< inspec_resources section="mongodb" platform="mongodb" >}}
