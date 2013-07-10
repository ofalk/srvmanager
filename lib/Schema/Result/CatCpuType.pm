use utf8;
package Schema::Result::CatCpuType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("CAT_CPU_TYPE");
__PACKAGE__->add_columns(
  "cpu_type_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);
__PACKAGE__->set_primary_key("cpu_type_id");
__PACKAGE__->has_many(
  "cat_server_models",
  "Schema::Result::CatServerModel",
  { "foreign.cat_cpu_type_id" => "self.cpu_type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1PDQtme0JYFUD4bPj6jeag


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
