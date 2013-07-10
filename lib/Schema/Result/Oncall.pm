use utf8;
package Schema::Result::Oncall;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ONCALL");
__PACKAGE__->add_columns(
  "oncall_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "adm_user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "adm_department_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "problem_description",
  { data_type => "varchar", is_nullable => 0, size => 80 },
  "start_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "stop_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "problem_details",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("oncall_id");
__PACKAGE__->belongs_to(
  "adm_department",
  "Schema::Result::AdmDepartment",
  { department_id => "adm_department_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "adm_user",
  "Schema::Result::AdmUser",
  { user_id => "adm_user_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7Gqm+GrTXAXjDSOkIp47zQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
