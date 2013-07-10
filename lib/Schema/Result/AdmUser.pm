use utf8;
package Schema::Result::AdmUser;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ADM_USER");
__PACKAGE__->add_columns(
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "adm_department_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "adm_role_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "x_key",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "full_name",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "mail_address",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);
__PACKAGE__->set_primary_key("user_id");
__PACKAGE__->belongs_to(
  "adm_department",
  "Schema::Result::AdmDepartment",
  { department_id => "adm_department_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "adm_role",
  "Schema::Result::AdmRole",
  { role_id => "adm_role_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->has_many(
  "adm_user2groups",
  "Schema::Result::AdmUser2group",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "change_requests_approved_by_uid",
  "Schema::Result::ChangeRequest",
  { "foreign.approved_by_uid" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "change_requests_raised_by_uid",
  "Schema::Result::ChangeRequest",
  { "foreign.raised_by_uid" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "oncalls",
  "Schema::Result::Oncall",
  { "foreign.adm_user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->many_to_many("groups", "adm_user2groups", "group");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-10 14:43:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lZHJnhE7rywyQFeUCJpe4Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
