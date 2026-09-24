resource "snowflake_warehouse" "kendrix_dev" {
  name = "KENDRIX_ER_DEV_WH"

  warehouse_size = "XSMALL"

  auto_suspend        = 60
  auto_resume         = true
  initially_suspended = true

  comment = "Kendrix Entity Resolution development warehouse"
}