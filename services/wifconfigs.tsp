import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

import "../models/wifconfig/model.tsp";
import "hyperfleet/shared/models/common/model.tsp";

using Http;
using OpenAPI;

namespace HyperFleet;

@tag("WIFConfigs")
@route("/wifconfigs")
@useAuth(HyperFleet.BearerAuth)
interface WIFConfigs {
  /**
   * Returns a paginated list of WIF configs, optionally filtered by labels or TSL query.
   */
  @get
  @route("")
  @summary("List WIF configs")
  @operationId("getWIFConfigs")
  getWIFConfigs(...QueryParams): Body<WIFConfigList>
    | Error
    | BadRequestResponse;

  /**
   * Returns a single WIF config by its ID.
   */
  @route("/{wifconfig_id}")
  @get
  @summary("Get WIF config by ID")
  @operationId("getWIFConfigById")
  getWIFConfigById(
    ...SearchParams,
    @path wifconfig_id: string,
  ): WIFConfig
    | Error
    | NotFoundResponse
    | BadRequestResponse;

  /**
   * Creates a new WIF config.
   */
  @route("")
  @post
  @summary("Create WIF config")
  @operationId("postWIFConfig")
  postWIFConfig(@body body: WIFConfigCreateRequest): {
    @statusCode statusCode: 201;
    @body wifconfig: WIFConfig;
  } | Error
    | BadRequestResponse;

  /**
   * Patches a WIF config by ID. Supports partial updates to spec and labels.
   */
  @route("/{wifconfig_id}")
  @patch
  @summary("Patch WIF config by ID")
  @operationId("patchWIFConfigById")
  patchWIFConfigById(
    @path wifconfig_id: string,
    @body body: WIFConfigPatchRequest,
  ): WIFConfig
    | Error
    | NotFoundResponse
    | BadRequestResponse
    | ConflictResponse;

  /**
   * Marks a WIF config for deletion.
   */
  @route("/{wifconfig_id}")
  @delete
  @summary("Request WIF config deletion")
  @operationId("deleteWIFConfigById")
  deleteWIFConfigById(
    @path wifconfig_id: string,
  ): {
    @statusCode statusCode: 202;
    @body wifconfig: WIFConfig;
  } | NotFoundResponse
    | ConflictResponse
    | Error
    | BadRequestResponse;

}
