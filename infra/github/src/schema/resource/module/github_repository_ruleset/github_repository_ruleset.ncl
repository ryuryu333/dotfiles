let { SingleElementArray } = import "../../../util/contract.ncl",
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
    | SingleElementArray,
},
in
{
  GithubRepositoryRulesetSchema =
    BaseSchema
    & {
      conditions
        | Array Dyn
        | SingleElementArray
        | optional
    },
  GithubRepositoryRulesetTagSchema =
    BaseSchema
    & {
      target | std.contract.Equal 'tag,
      conditions
        | Array Dyn
        | SingleElementArray,
    },
  GithubRepositoryRulesetBranchSchema =
    BaseSchema
    & {
      target | std.contract.Equal 'branch,
      conditions
        | Array Dyn
        | SingleElementArray,
    },
  GithubRepositoryRulesetPushSchema =
    BaseSchema
    & {
      target | std.contract.Equal 'push,
    },
}
