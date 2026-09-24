provider "snowflake" {
  role          = "SYSADMIN"
  authenticator = "SNOWFLAKE_JWT"

  private_key = file(
    pathexpand("~/.ssh/snowflake_rsa_key.p8")
  )
}