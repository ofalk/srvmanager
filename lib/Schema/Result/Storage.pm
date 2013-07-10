use utf8;
package Schema::Result::Storage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("STORAGE");
__PACKAGE__->add_columns(
  "storage_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "cat_storage_model_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_site_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_location_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "ip_addr_1",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "ip_addr_2",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);
__PACKAGE__->set_primary_key("storage_id");
__PACKAGE__->belongs_to(
  "cat_location",
  "Schema::Result::CatLocation",
  { location_id => "cat_location_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_site",
  "Schema::Result::CatSite",
  { site_id => "cat_site_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_storage_model",
  "Schema::Result::CatStorageModel",
  { storage_model_id => "cat_storage_model_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->has_many(
  "luns",
  "Schema::Result::Lun",
  { "foreign.storage_id" => "self.storage_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fOQXmEHU2JOA2Kw71e8Fjg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
