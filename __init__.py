import threestudio
from packaging.version import Version

if hasattr(threestudio, "__version__") and Version(threestudio.__version__) >= Version(
    "0.2.0"
):
    pass
else:
    if hasattr(threestudio, "__version__"):
        print(f"[INFO] threestudio version: {threestudio.__version__}")
    raise ValueError(
        "threestudio version must be >= 0.2.0, please update threestudio by pulling the latest version from github"
    )

from . import data
from .guidance import zeroscope_guidance, zeroscope_prompt_processor
from .systems import fourdfy
