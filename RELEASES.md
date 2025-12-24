# Release process

Throughout this document, replace $OLD_VERSION with the previous release and $NEW_VERSION with the next one. Versions should start with a v, e.g. `v2.40.0`.

# Deciding to release

1. Update your local master branch
2. Review the changes in git since the last release with a command like `git log --graph $OLD_VERSION...master` or online at https://github.com/gravitystorm/openstreetmap-carto/compare/$OLD_VERSION...master
3. Review [pull requests](https://github.com/gravitystorm/openstreetmap-carto/pulls) for anything that should be merged before release
4. Check [`preview.png`](preview.png) and update it if needed. Preferred way is to import current Chicago data, export new image (for example from Kosmtik via [this link](http://127.0.0.1:6789/openstreetmap-carto/export/?showExtent=true&format=png&width=849&height=310&scale=1&zoom=15&bounds=-87.65145778656006%2C41.86914537674214%2C-87.61502265930177%2C41.8790515319021)) and upload as new version of this file

Decide among the maintainers if a new release is due.

# Tagging a release
1. Check out master with git
2. Change the Unreleased section in [`CHANGELOG.md`](CHANGELOG.md) to the new version. Add any changes that are missing from the changelog and a new Unreleased section.
3. Commit the changelog changes and tag a release with `git tag -a $NEW_VERSION -m "Tag $NEW_VERSION"`. *Optional: Add `-s` and GPG sign the tag.*
4. Push the tag with `git push origin $NEW_VERSION`. If you use a different name for the gravitystorm/openstreetmap-carto remote, use it instead.
5. If there are any long-running development branches check them out and merge the new release with `git merge $NEW_RELEASE`.

# Notifications

1. Notify OSMF tile server admins [with an issue on OpenStreetMap Chef](https://github.com/openstreetmap/chef/issues/new?title=New%20OpenStreetMap%20Carto%20release,%20$NEW_RELEASE&body=A%20new%20version%20of%20OpenStreetMap%20Carto,%20[$NEW_RELEASE]%28https://github.com/gravitystorm/openstreetmap-carto/releases/tag/$NEW_RELEASE%29,%20has%20been%20released.). Add any deployment-related changes like new shapefiles or font changes to the ticket.

2. Write an email to dev@openstreetmap.org and talk@openstreetmap.org with the subject "OpenStreetMap Carto release $NEW_VERSION" and the body

```
Dear all,

Today, $NEW_VERSION of the OpenStreetMap Carto stylesheet (the default
stylesheet on the OSM website) has been released. Once changes are
deployed on the openstreetmap.org it will take couple of days before
all tiles show the new rendering.

If the tile server admins have rolled out the new version, change it to:

  Today, $NEW_VERSION of the OpenStreetMap Carto stylesheet (the default
  stylesheet on the OSM website) has been released and rolled out
  to the openstreetmap.org servers. It might take a couple of days
  before all tiles show the new rendering.

Changes include
*A list of changes*

Thanks to all the contributors for this release.

If there are new contributors, add

  including <name>, <name>, [a] new contributor[s].

If there has been a major PR merged, additional thanks can be added

For a full list of commits, see
https://github.com/gravitystorm/openstreetmap-carto/compare/$OLD_VERSION...$NEW_VERSION

As always, we welcome any bug reports at
https://github.com/gravitystorm/openstreetmap-carto/issues
```

3. Post an [openstreetmap.org diary entry](https://www.openstreetmap.org/diary/new) with the text from the email. Add links and other markdown if needed.

4. *Optional: Post on twitter with a link to the diary entry.*
