use utf8;
package Schema::Result::Lnxuser;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("LNXUSER");
__PACKAGE__->add_columns(
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "uid",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "gid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "additional_groups",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "homedir",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);
__PACKAGE__->set_primary_key("user_id");
__PACKAGE__->add_unique_constraint("NAME_UNIQUE", ["name"]);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9rLFQnvdYfV+Da5xlCHXfA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
