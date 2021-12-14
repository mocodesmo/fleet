import sentry_sdk


def setup_sentry():
    sentry_sdk.init(
        "https://00000.ingest.sentry.io/00000",
        traces_sample_rate=1.0,
    )
