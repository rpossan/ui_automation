defmodule WhiteBreadConfig do
  use WhiteBread.SuiteConfiguration

  suite name:          "All",
        context:       StepsDefinition,
        feature_paths: ["features/"]
end
