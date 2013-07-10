use utf8;
package Schema::Result::AdmUser2group;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ADM_USER2GROUP");
__PACKAGE__->add_columns(
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);
__PACKAGE__->set_primary_key("user_id", "group_id");
__PACKAGE__->belongs_to(
  "group",
  "Schema::Result::AdmGroup",
  { adm_group_id => "group_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "user",
  "Schema::Result::AdmUser",
  { user_id => "user_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:z6k5xXVylmpex+I7QhBb/A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
