import "@typespec/openapi";
import "hyperfleet/shared/models/common/model.tsp";
import "hyperfleet/shared/models/statuses/model.tsp";
import "hyperfleet/shared/models/resource/model.tsp";
import "./example_wifconfig.tsp";
import "./example_post.tsp";
import "./example_patch.tsp";

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

@extension("minProperties", 1)
@extension("additionalProperties", false)
@example(exampleWIFConfigPatchRequest)
model WIFConfigPatchRequest {
  spec?: WIFConfigSpec;
  labels?: Record<string>;
}

model WIFConfigList {
  ...List<WIFConfig>;
}
