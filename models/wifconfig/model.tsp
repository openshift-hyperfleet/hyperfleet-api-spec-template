import "@typespec/openapi";
import "hyperfleet/shared/models/common/model.tsp";
import "hyperfleet/shared/models/statuses/model.tsp";
import "hyperfleet/shared/models/resource/model.tsp";
import "./example_wifconfig.tsp";
import "./example_post.tsp";

using OpenAPI;

alias KindWIFConfig = "WIFConfig";

model WIFConfigSpec {
  /** Version of the WIF configuration */
  version: string;

  /** GCP project identifier */
  project_id: string;
}

model WIFConfigBase {
  ...APIResource;

  @minLength(1)
  @maxLength(63)
  @pattern("^[a-z0-9]([-a-z0-9]*[a-z0-9])?$")
  name: string;

  spec: WIFConfigSpec;
}

@example(exampleWIFConfig)
model WIFConfig {
  ...WIFConfigBase;
  ...APIMetadata;

  @minValue(1)
  generation: int32;

  status: ResourceStatus;
}

@example(exampleWIFConfigCreateRequest)
model WIFConfigCreateRequest {
  ...WIFConfigBase;
}

model WIFConfigList {
  ...List<WIFConfig>;
}
