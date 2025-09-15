+++
title = "About Chef InSpec MongoDB resources"
platform = "mongodb"
draft = false
linkTitle = "MongoDB resources"
summary = "Chef InSpec resources for auditing MongoDB"


[cascade]
  [cascade.params]
    gh_repo = "inspec-mongodb-resources"
    platform = "mongodb"

[menu.mongodb]
title = "About resources"
identifier = "inspec/resources/mongodb/about"
parent = "inspec/resources/mongodb"
+++

The Chef InSpec MongoDB resources allow you to audit a MongoDB database or configuration file.

## Support

The InSpec MongoDB resources were part of InSpec core through InSpec 6.
Starting in InSpec 7, they're released separately as a Ruby gem.

## Usage

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
