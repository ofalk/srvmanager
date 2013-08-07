use utf8;
package Schema::Result::CatVendor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("CAT_VENDOR");
__PACKAGE__->add_columns(
  "vendor_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "contact_person",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "contact_phone",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);
__PACKAGE__->set_primary_key("vendor_id");
__PACKAGE__->has_many(
  "cat_server_models",
  "Schema::Result::CatServerModel",
  { "foreign.cat_vendor_id" => "self.vendor_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "cat_storage_models",
  "Schema::Result::CatStorageModel",
  { "foreign.cat_vendor_id" => "self.vendor_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:53:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jyX8QAy4C+L0Oc4IjWaXpg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
