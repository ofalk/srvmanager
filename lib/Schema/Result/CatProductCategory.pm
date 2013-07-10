use utf8;
package Schema::Result::CatProductCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("CAT_PRODUCT_CATEGORY");
__PACKAGE__->add_columns(
  "product_category_id",
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
  "costs",
  { data_type => "decimal", is_nullable => 0, size => [10, 2] },
);
__PACKAGE__->set_primary_key("product_category_id");
__PACKAGE__->has_many(
  "luns",
  "Schema::Result::Lun",
  { "foreign.cat_product_category_id" => "self.product_category_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "servers",
  "Schema::Result::Server",
  { "foreign.cat_product_category_id" => "self.product_category_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Frnk1y5bHMOVum4Ewk53uw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
