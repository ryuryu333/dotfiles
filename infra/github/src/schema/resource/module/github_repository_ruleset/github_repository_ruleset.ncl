let contract_util = import "../../../../util/contract.ncl",
in
let ConditionSchema = {
  ref_name
    | Array {
      "include"
        | Array String
        | default
        = ["~ALL"],
      exclude
        | Array String
        | default
        = [],
    }
    | contract_util.SingleElementArray,
},
in
let BaseSchema = {
  name | String,
  repository | String,
  enforcement
    | [| 'active, 'disabled, 'evaluate |]
    | doc "evaluate is currently only supported for owners of type organization."
    | default
    = 'active,
  bypass_actors
    | Dyn
    | optional
    | doc "Don't use, if needed, make schema.",
  target
    | [| 'branch, 'tag, 'push |],
  rules
    | Array Dyn
    | contract_util.SingleElementArray,
},
in
{
  GithubRepositoryRulesetSchema =
    BaseSchema
    & {
      conditions
        | Array ConditionSchema
        | contract_util.SingleElementArray
        | optional
    },
  GithubRepositoryRulesetTagSchema =
    BaseSchema
    & {
      target | std.contract.Equal 'tag,
      conditions
        | Array ConditionSchema
        | contract_util.SingleElementArray,
    },
  GithubRepositoryRulesetBranchSchema =
    BaseSchema
    & {
      target | std.contract.Equal 'branch,
      conditions
        | Array ConditionSchema
        | contract_util.SingleElementArray,
    },
  GithubRepositoryRulesetPushSchema =
    BaseSchema
    & {
      target | std.contract.Equal 'push,
    },
}
