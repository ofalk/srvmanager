use utf8;
package Schema::Result::CatAsp;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("CAT_ASP");
__PACKAGE__->add_columns(
  "asp_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "service_manager",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "psp_element",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "sla_level",
  { data_type => "varchar", is_nullable => 1, size => 25 },
);
__PACKAGE__->set_primary_key("asp_id");
__PACKAGE__->add_unique_constraint("NAME", ["name"]);
__PACKAGE__->has_many(
  "cluster_packages",
  "Schema::Result::ClusterPackage",
  { "foreign.cat_asp_id" => "self.asp_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "servers",
  "Schema::Result::Server",
  { "foreign.cat_asp_id" => "self.asp_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:39hgBQgGT4Ev+lJTRW9izw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
