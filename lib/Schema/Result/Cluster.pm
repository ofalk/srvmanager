use utf8;
package Schema::Result::Cluster;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("CLUSTER");
__PACKAGE__->add_columns(
  "cluster_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "cat_cluster_software_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "software_version",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "cat_status_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);
__PACKAGE__->set_primary_key("cluster_id");
__PACKAGE__->belongs_to(
  "cat_cluster_software",
  "Schema::Result::CatClusterSoftware",
  { cluster_software_id => "cat_cluster_software_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_status",
  "Schema::Result::CatStatus",
  { status_id => "cat_status_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->has_many(
  "cluster_packages",
  "Schema::Result::ClusterPackage",
  { "foreign.cluster_id" => "self.cluster_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "servers",
  "Schema::Result::Server",
  { "foreign.cluster_id" => "self.cluster_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:53:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:squLNkS1+pLDivZ8MFB4Ag


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
