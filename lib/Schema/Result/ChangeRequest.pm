use utf8;
package Schema::Result::ChangeRequest;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("CHANGE_REQUEST");
__PACKAGE__->add_columns(
  "change_request_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "raised_by_uid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "approved_by_uid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "reason_for_change",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "implemented_by",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "start_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "stop_time",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "users_to_inform",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "impact_on",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "risks",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "change_short",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "change_long",
  { data_type => "text", is_nullable => 1 },
  "status",
  { data_type => "integer", is_nullable => 0 },
  "requested_by",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);
__PACKAGE__->set_primary_key("change_request_id");
__PACKAGE__->belongs_to(
  "approved_by_uid",
  "Schema::Result::AdmUser",
  { user_id => "approved_by_uid" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "raised_by_uid",
  "Schema::Result::AdmUser",
  { user_id => "raised_by_uid" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uyxVzkAy5r2iZy57DFetSQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
