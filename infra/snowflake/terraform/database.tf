resource "snowflake_database" "kendrix_er" {
  name    = "KENDRIX_ER"
  comment = "Kendrix Entity Resolution Datathon platform"
}

locals {
  schemas = toset([
    "RAW",
    "STG",
    "ER",
    "MASTER",
    "AUDIT",
    "APP"
  ])
}

resource "snowflake_schema" "schemas" {
  for_each = local.schemas

  database = snowflake_database.kendrix_er.name
  name     = each.value

  comment = "Kendrix Entity Resolution ${each.value} schema"
}