use utf8;
package Schema::Result::OperatorGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("OPERATOR_GROUP");
__PACKAGE__->add_columns(
  "operator_group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);
__PACKAGE__->set_primary_key("operator_group_id");
__PACKAGE__->has_many(
  "servers",
  "Schema::Result::Server",
  { "foreign.operator_group_id" => "self.operator_group_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:53:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4hhbffS7HRb4xkyhfXOBOA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
