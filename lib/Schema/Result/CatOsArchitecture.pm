use utf8;
package Schema::Result::CatOsArchitecture;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("CAT_OS_ARCHITECTURE");
__PACKAGE__->add_columns(
  "os_architecture_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);
__PACKAGE__->set_primary_key("os_architecture_id");
__PACKAGE__->has_many(
  "servers",
  "Schema::Result::Server",
  { "foreign.cat_os_architecture_id" => "self.os_architecture_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:53:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hgyHg3bkCOBmtZXsUwhCDg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
