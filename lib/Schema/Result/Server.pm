use utf8;
package Schema::Result::Server;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("SERVER");
__PACKAGE__->add_columns(
  "server_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "cat_site_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_asp_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_server_model_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_os_category_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_os_version_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_status_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_product_category_id",
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
  "cat_domain_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_support_level_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cat_os_architecture_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "cluster_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "hostname",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "delivery_date",
  {
    data_type => "date",
    datetime_undef_if_invalid => 1,
    default_value => "1980-11-17",
    is_nullable => 1,
  },
  "documentation_url",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "memory_in_mb",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "physical_cpus",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "cores_per_cpu",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "cpu_speed",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "application",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "rack",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "ip_address",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "subnet_mask",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "default_gateway",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "additional_ip",
  { data_type => "text", is_nullable => 1 },
  "management_ip",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "management_hostname",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "delivery_note_id",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "serial_nr",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "fc_attached",
  { data_type => "tinyint", is_nullable => 1 },
  "maintenance_end",
  {
    data_type => "date",
    datetime_undef_if_invalid => 1,
    default_value => "1980-11-17",
    is_nullable => 1,
  },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "iscsi_attached",
  { data_type => "tinyint", is_nullable => 1 },
  "autodiscovery",
  { data_type => "tinyint", is_nullable => 1 },
  "operator_group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "reboot_notes",
  { data_type => "text", is_nullable => 1 },
  "patch_notes",
  { data_type => "text", is_nullable => 1 },
  "patchtime",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "asset_id",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "tags",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "license_end",
  {
    data_type => "date",
    datetime_undef_if_invalid => 1,
    default_value => "1980-11-17",
    is_nullable => 1,
  },
  "license",
  { data_type => "varchar", is_nullable => 1, size => 17 },
  "uses_multipath",
  { data_type => "tinyint", default_value => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("server_id");
__PACKAGE__->belongs_to(
  "cat_asp",
  "Schema::Result::CatAsp",
  { asp_id => "cat_asp_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_domain",
  "Schema::Result::CatDomain",
  { domain_id => "cat_domain_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_location",
  "Schema::Result::CatLocation",
  { location_id => "cat_location_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_os_architecture",
  "Schema::Result::CatOsArchitecture",
  { os_architecture_id => "cat_os_architecture_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_os_category",
  "Schema::Result::CatOsCategory",
  { os_category_id => "cat_os_category_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_os_version",
  "Schema::Result::CatOsVersion",
  { os_version_id => "cat_os_version_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_product_category",
  "Schema::Result::CatProductCategory",
  { product_category_id => "cat_product_category_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "CASCADE" },
);
__PACKAGE__->belongs_to(
  "cat_server_model",
  "Schema::Result::CatServerModel",
  { server_model_id => "cat_server_model_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_site",
  "Schema::Result::CatSite",
  { site_id => "cat_site_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_status",
  "Schema::Result::CatStatus",
  { status_id => "cat_status_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "cat_support_level",
  "Schema::Result::CatSupportLevel",
  { support_level_id => "cat_support_level_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "CASCADE" },
);
__PACKAGE__->belongs_to(
  "cluster",
  "Schema::Result::Cluster",
  { cluster_id => "cluster_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);
__PACKAGE__->belongs_to(
  "operator_group",
  "Schema::Result::OperatorGroup",
  { operator_group_id => "operator_group_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "patchtime",
  "Schema::Result::CatPatchtime",
  { patchtime_id => "patchtime" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:53:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MBBi/SPhCfKNR8TR0F0vdA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
