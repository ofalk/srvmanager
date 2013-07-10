use utf8;
package Schema::Result::ClusterPackage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("CLUSTER_PACKAGE");
__PACKAGE__->add_columns(
  "cluster_package_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "cluster_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_asp_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "cat_status_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "ip_address",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);
__PACKAGE__->set_primary_key("cluster_package_id");
__PACKAGE__->belongs_to(
  "cat_asp",
  "Schema::Result::CatAsp",
  { asp_id => "cat_asp_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_status",
  "Schema::Result::CatStatus",
  { status_id => "cat_status_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cluster",
  "Schema::Result::Cluster",
  { cluster_id => "cluster_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->has_many(
  "luns",
  "Schema::Result::Lun",
  { "foreign.cluster_package_id" => "self.cluster_package_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SiwQQo8537VERW3hRklDcg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
