use utf8;
package Schema::Result::CatStorageModel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("CAT_STORAGE_MODEL");
__PACKAGE__->add_columns(
  "storage_model_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "cat_vendor_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);
__PACKAGE__->set_primary_key("storage_model_id");
__PACKAGE__->belongs_to(
  "cat_vendor",
  "Schema::Result::CatVendor",
  { vendor_id => "cat_vendor_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->has_many(
  "storages",
  "Schema::Result::Storage",
  { "foreign.cat_storage_model_id" => "self.storage_model_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HmMU6uqJYW+0uhqoUEyKHQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
