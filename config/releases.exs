# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

database_url =
  System.fetch_env!("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

secret_key_base =
  System.fetch_env!("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """


app_domain =
  System.fetch_env!("APP_DOMAIN") ||
    raise """
    environment variable APP_DOMAIN is missing.
    """

app_base_domain =
  System.fetch_env!("APP_BASE_DOMAIN") ||
    raise """
    environment variable APP_BASE_DOMAIN is missing.
    On production this is likely to be "auroville.org.in"
    On staging this is likely to be "talam-aks-staging.az.auroville.org.in"
    """

oauth_client_id =
  System.fetch_env!("OAUTH_CLIENT_ID") ||
    raise """
    environment variable OAUTH_CLIENT_ID is missing.
    You can get this value from Auroville Account site.
    """

oauth_client_secret =
  System.fetch_env!("OAUTH_CLIENT_SECRET") ||
    raise """
    environment variable OAUTH_CLIENT_SECRET is missing.
    You can get this value from Auroville Account site.
    """

oauth_login_url =
  System.fetch_env!("OAUTH_LOGIN_URL") ||
    raise """
    environment variable OAUTH_LOGIN_URL is missing.
    On production this is likely to be "https://account.auroville.org.in"
    """

s3_bucket_name =
  System.fetch_env!("S3_BUCKET_NAME") ||
    raise """
    environment variable S3_BUCKET_NAME is missing.
    On production this is likely to be "CC"
    """

s3_host =
  System.fetch_env!("S3_HOST") ||
    raise """
    environment variable S3_HOST is missing.
    On production this is likely to be "assets.auroville.org.in"
    """

s3_access_key =
  System.fetch_env!("S3_ACCESS_KEY") ||
    raise """
    environment variable S3_ACCESS_KEY is missing.
    """

s3_access_secret =
  System.fetch_env!("S3_ACCESS_SECRET") ||
    raise """
    environment variable S3_ACCESS_SECRET is missing.
    """

redirect_url = "https://#{app_domain}.#{app_base_domain}/oauth/auroville_account/callback"

mailgun_api_key =
  System.fetch_env!("MAILGUN_API_KEY") ||
    raise """
    environment variable MAILGUN_API_KEY is missing.
    """

asset_host = "https://#{s3_host}/#{s3_bucket_name}"

config :matrimandir, Matrimandir.Repo,
  url: database_url,
  pool_size: 10,
  ssl: false

config :matrimandir, MatrimandirWeb.Endpoint,
  url: [host: "#{app_domain}.#{app_base_domain}", port: 443, scheme: "https"],
  http: [:inet6, port: 4000],
  secret_key_base: secret_key_base

config :matrimandir, OAuth2,
  client_id: oauth_client_id,
  client_secret: oauth_client_secret,
  redirect_uri: redirect_url,
  site: oauth_login_url,
  strategy: MatrimandirWeb.AurovilleAccount

config :matrimandir, MatrimandirWeb.Endpoint, server: true

config :arc,
  storage: Arc.Storage.S3,
  bucket: s3_bucket_name,
  asset_host: asset_host

config :ex_aws, :s3, host: s3_host

config :ex_aws,
  debug_requests: true,
  access_key_id: [s3_access_key, :instance_role],
  secret_access_key: [s3_access_secret, :instance_role]

config :matrimandir, Matrimandir.Mailer,
  adapter: Bamboo.MailgunAdapter,
  api_key: mailgun_api_key,
  domain: "auroville.org.in"
